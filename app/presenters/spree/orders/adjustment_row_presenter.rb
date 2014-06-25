class Spree::Orders::AdjustmentRowPresenter < Spree::CommonPresenter

  presents :item
  presents :type
  presents :order

  def type
    @type
  end

  def label
    @item[:name]
  end

  def total
    Spree::Money.new(@item[:obj].sum(&:amount), currency: @order.currency)
  end
end
