class Spree::Products::PromotionsPresenter < Spree::CommonPresenter

    presents :product

    def promotions?
        promotions.any?
    end

    def promotions
        @product.possible_promotions
    end

    class PromotionPresenter < Spree::CommonPresenter
        presents :promotion

        def name
            @promotion.name
        end

        def description
            @promotion.description
        end

        def products?
            products.any?
        end

        def products
            @promotion.products
        end

        class ProductPresenter < Spree::CommonPresenter

            presents :product

            def product_link
                link_to @product.name, product_path(@product)
            end
        end
    end
end
