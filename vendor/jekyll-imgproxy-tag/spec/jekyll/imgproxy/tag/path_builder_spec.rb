# frozen_string_literal: true

require 'jekyll/imgproxy/tag/path_builder'

module Jekyll
  module Imgproxy
    class Tag
      describe PathBuilder do
        it 'adds a width'
        it 'adds a height'
        it 'adds width and height'

        # https://docs.imgproxy.net/generating_the_url?id=resizing-type
        it 'adds a resizing type'

        # https://docs.imgproxy.net/generating_the_url?id=gravity
        it 'adds a gravity option'

        # https://docs.imgproxy.net/generating_the_url?id=quality
        it 'adds a quality option'

        # https://docs.imgproxy.net/generating_the_url?id=max-bytes
        it 'adds a max bytes option'

        # https://docs.imgproxy.net/generating_the_url?id=cache-buster
        it 'adds a cache-buster option'
      end
    end
  end
end
