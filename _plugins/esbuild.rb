module Esbuild
  class Engine
    def initialize(bundle, destination)
      @bundle = bundle
      @input = bundle['input']
      @output = "#{destination}/#{input}"
      @minified = !!bundle['minified'] ? '--minify' : ''
    end

    def process
      `esbuild #{input} --log-level=silent --bundle --outfile=#{output} #{minified}`
      Jekyll.logger.info "Esbuild:", "Processed #{input}"
    end

    protected

    attr_reader :input, :output, :minified
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  js_bundles = site.config['esbuild']
  js_bundles.each do |bundle|
    engine = Esbuild::Engine.new(bundle, site.config['destination'])
    engine.process
  end
end
