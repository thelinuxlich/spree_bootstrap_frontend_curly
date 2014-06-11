class Spree::Checkout::ConfirmPresenter < Spree::CommonPresenter

    presents :order

    def order_details
        render partial: 'spree/shared/order_details', locals: { order: @order }
    end
end
