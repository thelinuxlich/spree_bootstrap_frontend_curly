class Spree::Products::CartFormPresenter < Spree::CommonPresenter

    presents :product

    def populate_orders_url
       populate_orders_path
    end

    def variants_and_option_values?
        @product.variants_and_option_values(current_currency).any?
    end

    def variants
        render partial: "spree/products/variant", collection: @product.variants_and_option_values(current_currency), as: "variant"
    end

    def variant_hidden_id
        hidden_field_tag "variant_id", @product.master.id
    end

    def price
        display_price(@product)
    end

    def currency
        @product.currency
    end

    def price_in_current_currency?
        @product.price_in(current_currency) and !@product.price.nil?
    end

    def product_master_can_supply?
       @product.master.can_supply?
    end
end
