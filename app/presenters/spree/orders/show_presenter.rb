class Spree::Orders::ShowPresenter < Spree::CommonPresenter

    presents :order

    def order_number
        Spree.t(:order_number, :number => @order.number)
    end

    def title
        accurate_title
    end

    def order_completed?
        params.has_key? :checkout_complete
    end

    def order_details
        render partial: 'spree/shared/order_details', locals: { order: @order }
    end
end
