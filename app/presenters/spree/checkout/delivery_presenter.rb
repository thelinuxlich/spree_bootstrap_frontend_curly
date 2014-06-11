class Spree::Checkout::DeliveryPresenter < Spree::CommonPresenter

    presents :shipment
    presents :order

    def stock_location_name
        @shipment.stock_location.name
    end

    def shipment_id
        @shipment.id
    end

    def stock_contents
        @shipment.manifest
    end

    def shipping_rates
        @shipment.shipping_rates
    end

    def differentiator_missing?
        @differentiator.try(:missing?)
    end

    def missing_differentiators
        @differentiator.missing
    end

    def shipping_instructions?
        Spree::Config[:shipping_instructions].present?
    end

    class MissingDifferentiatorPresenter < Spree::CommonPresenter

        presents :missing_differentiator

        def image
            mini_image(@missing_differentiator)
        end

        def name
            @missing_differentiator.name
        end

        def quantity
            @missing_differentiator.quantity
        end

        def price
            display_price(@missing_differentiator)
        end
    end

    class ShippingRatePresenter < Spree::CommonPresenter

        presents :shipping_rate
        presents :shipment

        def checked_shipping_rate
            @shipping_rate.id == @shipment.selected_shipping_rate_id ? "checked" : ""
        end

        def rate_id
            @shipping_rate.id
        end

        def name
            @shipping_rate.name
        end

        def cost
            @shipping_rate.display_cost
        end
    end

    class StockContentPresenter < Spree::CommonPresenter

        presents :stock_content

        def image
            mini_image(@stock_content.variant)
        end

        def name
            @stock_content.variant.name
        end

        def quantity
            @stock_content.quantity
        end

        def price
            display_price(@stock_content.variant)
        end
    end
end
