class Spree::Products::TaxonsPresenter < Spree::CommonPresenter
    presents :product

    def taxons?
        @product.taxons.present?
    end

    def taxons
        @product.taxons
    end

    class TaxonPresenter < Spree::CommonPresenter
        presents :taxon

        def taxon_link
            link_to @taxon.name, seo_url(@taxon)
        end
    end
end
