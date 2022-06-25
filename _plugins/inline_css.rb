module Jekyll
  class InlineCssTag < Liquid::Tag
    def initialize(tag_name, css_path, _tokens)
      super

      @css_path = css_path
      @raw_css = File.read(
         File.expand_path("./_site#{css_path}".gsub("\"", '').strip)
      ).gsub(
        "url(fonts",
        "url(/assets/css/fonts"
      )
    end

    def render(context)
      if ENV['JEKYLL_ENV'] == 'production'
        %Q{<style type="text/css" media="screen">#{@raw_css}</style>}
      else
        %Q{<link rel="stylesheet" href="#{@css_path}">}
      end
    end
  end
end

Liquid::Template.register_tag('inline_css', Jekyll::InlineCssTag)
