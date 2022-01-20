# frozen_string_literal: true

require 'mini_magick'

module SocialMedia
  # Generator to convert image to a social card photo
  class Images < Jekyll::Generator
    attr_accessor :post, :photo

    def generate(site)
      photo_posts_in(site).each do |post|
        @post = post
        create_directory
        resize_photo
        add_title_at_top
        draw_rectangle_at_bottom
        add_title_to_bottom
        write_file
      end
    end

    private

    def create_directory
      FileUtils.mkdir_p(
        File.dirname(
          File.absolute_path(@post.data['photo'].gsub(/images/, 'images/social'))
        )
      )
    end

    def resize_photo
      @photo = MiniMagick::Image.new(@post.data['photo'])
      @photo.resize '1080x570^'
    end

    def photo_posts_in(site)
      site.posts.docs.select { |post| post.data['photo'] }
    end

    def write_file
      photo.format 'jpg'
      photo.write post.data['photo'].gsub(/images/, 'images/social')
    end

    def add_title_to_bottom
      @photo = photo.combine_options do |c|
        c.gravity 'Southwest'
        c.pointsize '42'
        c.font './_plugins/social_images_generator/RobotoCondensed-Regular.ttf'
        c.draw "Text 28,6'#{post.data['title']}'"
        c.fill('#484F53')
      end
    end

    def add_title_at_top
      @photo = photo.composite(title_bar) do |c|
        c.compose 'Over'
        c.geometry '+0+0'
      end
    end

    def draw_rectangle_at_bottom
      @photo = @photo.combine_options do |c|
        c.draw "rectangle 0,#{height - 68} #{width},#{height}"
        c.fill '#FFFFFF'
      end
    end

    def title_bar
      @title_bar ||= MiniMagick::Image.new('./_plugins/social_images_generator/title_bar.png')
    end

    def width
      1080
    end

    def height
      photo.dimensions[1]
    end
  end
end
