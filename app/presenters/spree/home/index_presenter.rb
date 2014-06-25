class Spree::Home::IndexPresenter < Spree::CommonPresenter

  presents :products
  presents :taxonomies
  presents :searcher
  presents :taxon, default: nil

  def setup!
    content_for :sidebar do
      render partial: 'spree/shared/taxonomies', locals: {taxonomies: @taxonomies, taxon: @taxon}
    end
  end

  def products
    render partial: 'spree/shared/products', locals: {products: @products, searcher: @searcher, taxon: @taxon}
  end
end
