# frozen_string_literal: true

module SocialMedia
  # transform path of photo to path of social image
  module PhotoFilter
    def facebook_image(input)
      input
        .gsub(/^\.\//, '')
        .gsub(/images/, 'images/social/facebook')
    end

    def twitter_image(input)
      input
        .gsub(/^\.\//, '')
        .gsub(/images/, 'images/social/twitter')
    end
  end
end

Liquid::Template.register_filter(SocialMedia::PhotoFilter)
