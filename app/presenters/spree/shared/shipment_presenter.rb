class Spree::Shared::ShipmentPresenter < Spree::CommonPresenter

  presents :shipment

  def shipment_details_text
    Spree.t(:shipment_details, :stock_location => @shipment.stock_location.name, :shipping_method => @shipment.shipping_method.name)
  end
end
