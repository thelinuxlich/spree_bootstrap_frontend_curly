class Spree::Products::IndexPresenter < Spree::CommonPresenter

    presents :taxon, default: nil
    presents :taxonomies
    presents :products
    presents :searcher

    def sidebar
        if "spree/products" == params[:controller] && @taxon || !@taxonomies.empty?
            content_for :sidebar do
                if "spree/products" == params[:controller] && @taxon
                    render partial: 'spree/shared/filters', locals: {taxon: @taxon}
                else
                    render partial: 'spree/shared/taxonomies', locals: {taxonomies: @taxonomies}
                end
            end
        end
    end

    def products?
        @products.present?
    end

    def products
        render partial: 'spree/shared/products', collection: @products, locals: { taxon: @taxon, searcher: @searcher }
    end
end
