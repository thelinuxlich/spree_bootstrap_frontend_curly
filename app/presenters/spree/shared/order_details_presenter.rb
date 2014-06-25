class Spree::Shared::OrderDetailsPresenter < Spree::CommonPresenter

  presents :order

  def order_has_step_address?
    @order.has_step?("address")
  end

  def order_has_step_delivery?
    @order.has_step?("delivery")
  end

  def edit_address_link
    link_to edit_text, checkout_state_path(:address) unless @order.completed?
  end

  def address
    render :partial => 'spree/shared/address', :locals => {:address => @order.ship_address}
  end

  def billing_address
    render :partial => 'spree/shared/address', :locals => {:address => @order.bill_address}
  end

  def edit_delivery_link
    link_to edit_text, checkout_state_path(:delivery) unless @order.completed?
  end

  def edit_payment_link
    link_to edit_text, checkout_state_path(:payment) unless @order.completed?
  end

  def own_order_has_step_address?
    @order.has_step?("address")
  end

  def own_order_has_step_delivery?
    @order.has_step?("delivery")
  end

  def shipments
    render partial: 'spree/shared/shipment', collection: @order.shipments, as: "shipment"
  end

  def shipment_tracking
    render(:partial => 'spree/shared/shipment_tracking', :locals => {:order => @order}) if @order.shipped?
  end

  def payments
    render partial: 'spree/payments/payment', collection: @order.payments.valid
  end

  def order_line_items
    render partial: 'spree/shared/order_line_item', collection: @order.line_items, as: "item"
  end

  def order_display_total
    @order.display_total.to_html
  end

  def order_display_item_total
    @order.display_item_total.to_html
  end

  def order_line_item_adjustments?
    @order.line_item_adjustments.exists?
  end

  def order_all_adjustments_promotion_eligible?
    @order.all_adjustments.promotion.eligible.exists?
  end

  def order_all_adjustments_tax?
    @order.all_adjustments.tax.exists?
  end

  def adjustments_promotion
    render partial: "spree/shared/adjustment_promotion", collection: @order.all_adjustments.promotion.eligible.group_by(&:label), as: "item"
  end

  def adjustments_tax
    render partial: "spree/shared/adjustment_tax", collection: @order.all_adjustments.tax.group_by(&:label), as: "item"
  end

  def order_shipments
    render partial: "spree/shared/order_shipment", collection: @order.shipments.group_by { |s| s.shipping_method.name }, as: "item"
  end

  def order_adjustments
    render partial: "spree/shared/order_adjustment",
           collection: @order.adjustments.eligible.reject { |a| a.source_type == 'Spree::TaxRate' && a.amount == 0 }, as: "adjustment"
  end
end
