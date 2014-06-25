class Spree::Orders::FormPresenter < Spree::CommonPresenter
  presents :order

  def errors
    render partial: 'spree/shared/error_messages', locals: {target: @order}
  end

  def line_items
    render partial: 'spree/orders/line_item', collection: @order.line_items, locals: {order: @order}
  end

  def order_all_adjustments?
    @order.all_adjustments.exists?
  end

  def adjustments
    render partial: "spree/orders/adjustments", locals: {order: @order}
  end

  def cart_subtotal
    Spree.t(:cart_subtotal, :count => @order.line_items.sum(:quantity))
  end

  def total
    @order.display_item_total
  end
end
