class Spree::Shared::ShipmentTrackingLinkPresenter < Spree::CommonPresenter
        presents :shipment

        def shipment_link
            link_to_tracking(@shipment)
        end
end
