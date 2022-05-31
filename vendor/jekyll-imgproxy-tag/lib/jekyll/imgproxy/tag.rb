# frozen_string_literal: true

require 'jekyll'

module Jekyll
  module Imgproxy
    class Tag < Liquid::Tag
      VERSION = '0.1.0'

      def initialize(tag_name, markup, tokens)
        super
        @markup = markup
      end

      def render(_context)
        'Thanks for reading!'
      end

      protected

      attr_accessor :markup
    end
  end
end

Liquid::Template.register_tag('imgproxy_url', Jekyll::Imgproxy::Tag)
