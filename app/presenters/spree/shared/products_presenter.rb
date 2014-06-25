class Spree::Shared::ProductsPresenter < Spree::CommonPresenter

  presents :searcher
  presents :taxon
  presents :products

  def setup!
    if (!@products.is_a?(Array) && !@products.is_a?(ActiveRecord::Relation))
      @products = [@products]
    end
  end

  def pagination_links
    content_for :head do
      p = paginated_products
      if p.respond_to?(:num_pages)
        rel_next_prev_link_tags p
      end
    end
  end

  def keywords?
    params.key?(:keywords) && @products.present?
  end

  def products?
    @products.present?
  end

  def products
    render partial: 'spree/shared/product', collection: @products, as: "product", locals: {taxon: @taxon}
  end

  def paginated_products
    p = @searcher.retrieve_products if params.key?(:keywords)
    p ||= @products
  end

  def reset_cycle_classes
    reset_cycle(:classes)
  end

  def products_pagination
    p = paginated_products
    if p.respond_to?(:num_pages)
      paginate p, theme: 'twitter-bootstrap-3'
    end
  end
end
