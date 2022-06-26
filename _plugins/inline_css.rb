module Jekyll
  class InlineCssTag < Liquid::Tag
    def initialize(tag_name, css_path, _tokens)
      super
      @css_path = css_path
      @inlinable = ENV['JEKYLL_ENV'] == 'production' || !!ENV['INLINE_CSS']
    end

    def render(context)
      @context = context

      return %Q{<style type="text/css" media="screen">#{raw_css}</style>} if inlinable?

      %Q{<link rel="stylesheet" href="#{css_path}">}
    end

    private

    attr_reader :css_path, :inlinable, :context

    def inlinable?
      inlinable && File.exists?(full_path)
    end

    def raw_css
      File.read(full_path)
    end

    def full_path
      path = File.expand_path(css_path.strip)
      path = "/#{path}" unless path.start_with?("/")
      path = "#{context['site']['destination']}#{path}"
      path
    end
  end
end

Liquid::Template.register_tag('inline_css', Jekyll::InlineCssTag)
