class Spree::Orders::AdjustmentRowPresenter < Spree::CommonPresenter

    presents :item
    presents :type
    presents :order

    def type
        @type
    end

    def label
        @item[0]
    end

    def total
        Spree::Money.new(@item[1].sum(&:amount), :currency => @order.currency)
    end
end
