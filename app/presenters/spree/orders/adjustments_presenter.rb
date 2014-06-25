class Spree::Orders::AdjustmentsPresenter < Spree::CommonPresenter
  presents :order

  def line_item_adjustments_promotion?
    @order.line_item_adjustments.promotion.eligible.empty?
  end

  def line_item_adjustments_tax?
    @order.line_item_adjustments.tax.eligible.empty?
  end

  def line_item_adjustments_eligible?
    @order.line_item_adjustments.eligible.empty?
  end

  def adjustments_promotion_eligible_row
    # label, adjustments
    orders = @order.all_adjustments.promotion.eligible.group_by(&:label)
    render partial: "spree/orders/adjustment_row", collection: hash_to_arr(orders), as: "item", locals: {type: Spree.t(:promotion), order: @order}
  end

  def adjustments_tax_eligible_row
    # label, adjustments
    orders = @order.all_adjustments.tax.eligible.group_by(&:label)
    render partial: "spree/orders/adjustment_row", collection: hash_to_arr(orders), as: "item", locals: {type: Spree.t(:tax), order: @order}
  end

  def adjustments_eligible_row
    # label, adjustments
    orders = @order.adjustments.eligible.group_by(&:label)
    render "spree/orders/adjustment_row", collection: hash_to_arr(orders), as: "item", locals: {type: Spree.t(:adjustment), order: @order}
  end

  def shipments
    @order.shipments
  end

  private

    def hash_to_arr(hash)
      results = []
      hash.each do |k, v|
        results << { name: k, obj: v }
      end
      results
    end

  class ShipmentPresenter < Spree::CommonPresenter
    presents :shipment

    def shipping_method_name
      @shipment.shipping_method.name
    end

    def display_discounted_cost
      @shipment.display_discounted_cost
    end
  end
end
