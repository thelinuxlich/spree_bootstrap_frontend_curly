class Spree::Taxons::ShowPresenter < Spree::CommonPresenter

  presents :taxon
  presents :products
  presents :taxonomies

  def setup!
    content_for :sidebar do
      content_tag :div, "data-hook" => "taxon_sidebar_navigation" do
        render(partial: 'spree/shared/taxonomies', locals: {taxonomies: @taxonomies, taxon: @taxon}) + (render(partial: 'spree/shared/filters', locals: {taxon: @taxon}) if @taxon.children.empty?)
      end
    end
  end

  def taxon_name
    @taxon.name
  end

  def products
    render partial: 'spree/shared/products', locals: {products: @products, taxon: @taxon}
  end

  def keywords?
    params[:keywords].present?
  end

  def taxon
    render partial: 'taxon', collection: @taxon.children
  end
end
