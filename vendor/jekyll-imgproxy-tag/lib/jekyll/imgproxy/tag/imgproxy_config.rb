# frozen_string_literal: true

require 'jekyll'

module Jekyll
  module Imgproxy
    class Tag
      class ImgproxyConfig
        attr_reader \
          :base_url,
          :key,
          :salt,
          :aws_bucket

        def initialize
          @base_url   = fetch_config(:base_url)
          @key        = fetch_config(:key)
          @salt       = fetch_config(:salt)
          @aws_bucket = fetch_config(:aws_bucket)
        end

        private

        def fetch_config(key)
          value = Jekyll.configuration['imgproxy'][key.to_s]
          return ENV[value.gsub(/^ENV_/, '')] if value&.match?(/^ENV_/)

          value
        end
      end
    end
  end
end
