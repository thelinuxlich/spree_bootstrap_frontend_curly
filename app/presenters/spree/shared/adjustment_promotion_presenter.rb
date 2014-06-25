class Spree::Shared::AdjustmentPromotionPresenter < Spree::CommonPresenter

  presents :item

  def label
    @item[0]
  end

  def total
    Spree::Money.new(@item[1].sum(&:amount))
  end
end
