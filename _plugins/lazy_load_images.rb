# frozen_string_literal: true

module LazyLoadImages
  PLACEHOLDER="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="

  def lazy_load_images(input)
    input
      .gsub(
        /source srcset=/,
        "source data-srcset="
      )
      .gsub(
        /img src=/,
        %Q{img src="#{PLACEHOLDER}" class="lazyload" data-src=}
      )
  end
end

Liquid::Template.register_filter(LazyLoadImages)
