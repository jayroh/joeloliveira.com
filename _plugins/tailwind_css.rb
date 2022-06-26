module TailwindCss
  class Engine
    def initialize(bundle, destination)
      @bundle = bundle
      @input = bundle['input']
      @destination = destination
      @output = ".jekyll-cache/#{input}"
      @minified = !!bundle['minified']
      @config = bundle['config'] ? "--config #{bundle['config']}" : nil
    end

    def process
      contents = File.read(input).gsub(/^---$/, '')
      tempfile.write contents
      tempfile.rewind

      `tailwindcss --input #{tempfile.path} --output #{output} #{config}`
      Jekyll.logger.info "Tailwind:", "Processed #{input}"

      if minified
        `parcel-css --minify --nesting #{output} -o #{output}`
        Jekyll.logger.info "Tailwind:", "Minified output"
      end
    ensure
      tempfile.close
      tempfile.unlink
    end

    def copy
      final_path = "#{destination}/#{input}"
      final_dir = File.dirname final_path

      if File.exist? output
        FileUtils.mkdir_p final_dir
        FileUtils.cp output, final_path
        Jekyll.logger.info "Tailwind:", "Copied to #{final_path}"
      end
    end

    def cleanup
      FileUtils.rm output
      Jekyll.logger.info "Tailwind:", "Cleaned out cached file"
    end


    protected

    attr_reader :input, :output, :minified, :config, :destination

    private

    def tempfile
      @_tempfile ||= Tempfile.new(input)
    end
  end
end

# Build and copy the css before the pages are generated.
# Why? If, at any point, you plan to inline css then it needs to exist
# before the pages are generated and written.
Jekyll::Hooks.register :pages, :post_init do |page|
  css_bundles = page.site.config['tailwindcss']

  css_bundles.each do |bundle|
    if /\.css$/ =~ page.url && page.url.include?(bundle['input'])
      engine = TailwindCss::Engine.new(bundle, page.site.config['destination'])
      engine.process
      engine.copy
    end
  end
end

# Finally, copy the css over to its final destination and clean up the cache files.
Jekyll::Hooks.register :pages, :post_write do |page|
  css_bundles = page.site.config['tailwindcss']

  css_bundles.each do |bundle|
    if /\.css$/ =~ page.url && page.url.include?(bundle['input'])
      engine = TailwindCss::Engine.new(bundle, page.site.config['destination'])
      engine.copy
      engine.cleanup
    end
  end
end

