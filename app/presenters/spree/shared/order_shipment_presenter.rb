class Spree::Shared::OrderShipmentPresenter < Spree::CommonPresenter

    presents :item

    def name
        @item[0]
    end

    def total
        Spree::Money.new(@item[1].sum(&:discounted_cost)).to_html
    end
end
