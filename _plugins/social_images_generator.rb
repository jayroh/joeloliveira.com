# frozen_string_literal: true

require 'mini_magick'
require 'pry'

module SocialMedia
  class Images < Jekyll::Generator
    def generate(site)
      site.posts.docs.each do |post|
        next unless post.data['photo']

        FileUtils.mkdir_p(
          File.dirname(
            File.absolute_path(
              post.data['photo'].gsub(/images/, 'images/social')
            )
          )
        )

        title = MiniMagick::Image.new('./_plugins/social_images_generator/title_bar.png')
        photo = MiniMagick::Image.new(post.data['photo'])
        photo.resize '1080x570^'

        result = photo.composite(title) do |c|
          c.compose 'Over' # OverCompositeOp
          c.geometry '+0+0' # copy title onto photo from (0, 0)
        end

        result.format 'jpg'
        result.write post.data['photo'].gsub(/images/, 'images/social')
      end
    end
  end
end
