class Spree::Orders::EditPresenter < Spree::CommonPresenter
  presents :body_id, default: nil
  presents :order

  def setup!
    @body_id = 'cart'
  end

  def order_line_items?
    @order.line_items.present?
  end

  def order(field)
    @order[field]
  end

  def order_form
    render partial: 'spree/orders/form', locals: {order: @order}
  end
end
