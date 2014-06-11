class Spree::Taxons::TaxonPresenter < Spree::CommonPresenter

    presents :taxon

    def taxon_link
        link_to @taxon.name, seo_url(taxon), :class => 'breadcrumbs'
    end

    def products
        render partial: 'spree/shared/products', locals: { products: taxon_preview(@taxon), taxon: @taxon }
    end
end
