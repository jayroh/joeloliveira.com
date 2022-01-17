# frozen_string_literal: true

require 'mini_magick'
require 'pry'

module SocialMedia
  # Various paths for the post's images
  class ImagesPath
    attr_reader :source

    def initialize(post)
      @source = post.data['photo']
    end

    def twitter
      @twitter ||= source.gsub(/images/, 'images/social/twitter')
    end

    def facebook
      @facebook ||= source.gsub(/images/, 'images/social/facebook')
    end

    def images_exist?
      File.exist?(twitter) && File.exist?(facebook)
    end
  end

  # Image creator
  class ImageCreator
    DIMENSIONS = {
      twitter: [1024, 512],
      facebook: [1200, 630]
    }.freeze

    attr_reader(
      :image_path,
      :width,
      :height,
      :target_file,
      :image,
      :title
    )

    def initialize(image_path, social:, title:)
      @image_path = image_path
      @image = MiniMagick::Image.new(image_path.source)
      @width = DIMENSIONS[social][0]
      @height = DIMENSIONS[social][1]
      @target_file = image_path.send social
      @title = title
    end

    def create!
      backup_original
      create_directory
      resize_photo
      add_overlays
      write_file
      restore_original
    end

    private

    def backup_original
      FileUtils.cp(image_path.source, "#{image_path.source}.bak")
    end

    def restore_original
      FileUtils.mv( "#{image_path.source}.bak", image_path.source)
    end

    def create_directory
      FileUtils.mkdir_p(
        File.dirname(
          File.absolute_path(target_file)
        )
      )
    end

    def resize_photo
      @image = @image.resize "#{width}x"
      @image = @image.crop "#{width}x#{height}+0+#{(@image.height - height) / 2}"
    end

    def add_overlays
      title_bar = MiniMagick::Image.new('./_plugins/social_images_generator/title_bar.png')

      @image = @image.composite(title_bar) do |c|
        c.compose 'Over'
        c.geometry '+0+0'
      end

      @image = @image.combine_options do |c|
        c.draw "rectangle 0,#{height - 68} #{width},#{height}"
        c.fill '#FFFFFF'
      end

      @image = @image.combine_options do |c|
        c.gravity 'Southwest'
        c.pointsize '42'
        c.font './_plugins/social_images_generator/RobotoCondensed-Regular.ttf'
        c.draw "Text 28,6'#{title}'"
        c.fill('#484F53')
      end
    end

    def write_file
      @image.format 'jpg'
      @image.write target_file
    end
  end

  # Generator to convert image to a social card photo
  class Images < Jekyll::Generator
    attr_accessor :post, :photo, :image_path

    def generate(site)
      photo_posts_in(site).each do |post|
        @image_path = SocialMedia::ImagesPath.new(post)
        next if image_path.images_exist?

        SocialMedia::ImageCreator.new(image_path, social: :twitter, title: post.data['title']).create!
        SocialMedia::ImageCreator.new(image_path, social: :facebook, title: post.data['title']).create!
      end
    end

    private

    def photo_posts_in(site)
      site.posts.docs.select { |post| post.data['photo'] }
    end
  end
end
