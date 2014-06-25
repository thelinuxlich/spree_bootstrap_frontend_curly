class Spree::Products::ThumbnailsPresenter < Spree::CommonPresenter

  presents :product

  def images?
    (@product.images + @product.variant_images).uniq.size > 1
  end

  def images
    @product.images
  end

  def variants?
    @product.has_variants?
  end

  def variants
    @product.variant_images.reject { |i| @product.images.include?(i) }
  end

  class VariantPresenter < Spree::CommonPresenter

    presents :variant

    def variant_dom_id
      @variant.viewable.id
    end

    def variant_link
      link_to(image_tag(@variant.attachment.url(:mini), class: "thumbnail"), @variant.attachment.url(:product))
    end
  end

  class ImagePresenter < Spree::CommonPresenter

    presents :image

    def image_link
      link_to(image_tag(@image.attachment.url(:mini), class: "thumbnail"), @image.attachment.url(:product))
    end

    def image_dom_id
      @image.viewable.id
    end
  end
end
