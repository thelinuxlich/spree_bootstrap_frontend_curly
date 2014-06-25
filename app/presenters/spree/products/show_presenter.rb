class Spree::Products::ShowPresenter < Spree::CommonPresenter

  presents :product
  presents :product_properties

  def setup!
    @body_id = 'product-details'
  end

  def cache_key
    [current_currency, @product]
  end

  def image
    render partial: 'image', locals: {product: @product}
  end

  def thumbnails
    render partial: 'thumbnails', locals: {product: @product}
  end

  def properties
    render partial: 'properties', locals: {product_properties: @product_properties}
  end

  def promotions
    render partial: 'promotions', locals: {product: @product}
  end

  def title
    accurate_title
  end

  def description
    product_description(@product) rescue Spree.t(:product_has_no_description)
  end

  def cart_form
    render partial: 'cart_form', locals: {product: @product}
  end

  def taxons
    render partial: 'taxons', locals: {product: @product}
  end

end
