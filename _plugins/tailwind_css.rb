module TailwindCss
  class Engine
    def initialize(bundle, destination)
      @bundle = bundle
      @input = bundle['input']
      @output = "#{destination}/#{input}"
      @minified = !!bundle['minified']
      @config = bundle['config'] ? "--config #{bundle['config']}" : nil
    end

    def process
      contents = File.read(input).gsub(/^---$/, '')
      tempfile.write contents
      tempfile.rewind

      `tailwindcss --input #{tempfile.path} --output #{output} #{config}`
      Jekyll.logger.info "Tailwind:", "Processed #{input} to #{output}"

      if minified
        `parcel-css --minify --nesting #{output} -o #{output}`
        Jekyll.logger.info "Tailwind:", "Minified #{output}"
      end
    ensure
      tempfile.close
      tempfile.unlink
    end

    protected

    attr_reader :input, :output, :minified, :config

    private

    def tempfile
      @_tempfile ||= Tempfile.new(input)
    end
  end
end

Jekyll::Hooks.register :pages, :post_write do |page|
  css_bundles = page.site.config['tailwindcss']

  css_bundles.each do |bundle|
    if /\.css$/ =~ page.url
      engine = TailwindCss::Engine.new(bundle, page.site.config['destination'])
      engine.process
    end
  end
end

