# frozen_string_literal: true

require 'openssl'
require 'base64'

module Jekyll
  module Imgproxy
    class Tag
      class UrlGenerator
        def initialize(config, options)
          @config = config
          @options = options
        end

        def url
          path = PathBuilder.new(config, options).build
          digest = OpenSSL::Digest.new('sha256')
          hmac = Base64.urlsafe_encode64(OpenSSL::HMAC.digest(digest, key, "#{salt}#{path}")).tr('=', '')
          signed_path = "/#{hmac}#{path}"

          "#{config.base_url}#{signed_path}"
        end

        protected

        attr_reader :config, :options

        private

        def key
          [config.key].pack("H*")
        end

        def salt
          [config.salt].pack("H*")
        end
      end
    end
  end
end
