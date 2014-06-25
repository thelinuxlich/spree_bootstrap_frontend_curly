class Spree::Shared::ProductPresenter < Spree::CommonPresenter

  presents :taxon
  presents :product

  def product_id
    @product.id
  end

  def cache_key
    @taxon.present? ? [current_currency, @taxon, @product] : [current_currency, @product]
  end

  def small_image_link
    link_to small_image(@product, :itemprop => "image"), @product, :itemprop => 'url'
  end

  def product_link
    link_to truncate(@product.name, :length => 50), @product, :class => 'info', :itemprop => "name", :title => @product.name
  end

  def product_price
    display_price(@product)
  end
end
