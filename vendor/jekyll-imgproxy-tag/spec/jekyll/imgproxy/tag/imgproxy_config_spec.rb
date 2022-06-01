# frozen_string_literal: true

require 'jekyll/imgproxy/tag/imgproxy_config'

module Jekyll
  module Imgproxy
    class Tag
      describe ImgproxyConfig do
        it 'reads the yaml'
        it 'raises an error if the salt is not set'
        it 'raises an error if the key is not set'
        it 'raises an error if the base_url is not set'
        it 'raises an error if the aws_bucket is not set'
      end
    end
  end
end
