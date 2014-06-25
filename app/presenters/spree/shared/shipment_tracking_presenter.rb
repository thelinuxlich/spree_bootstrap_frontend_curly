class Spree::Shared::ShipmentTrackingPresenter < Spree::CommonPresenter

  presents :order

  def shipments?
    @order.shipments.trackable.any?
  end

  def shipment_tracking_links
    render :partial => "spree/shared/shipment_tracking_link", :collection => @order.shipments.trackable, :as => "shipment"
  end
end
