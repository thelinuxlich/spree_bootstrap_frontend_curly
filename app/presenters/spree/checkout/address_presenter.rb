class Spree::Checkout::AddressPresenter < Spree::CommonPresenter

    presents :order

    def bill_form
        render partial: 'spree/address/form', locals: { form: "bill_address", available_countries: available_countries,address_type: 'billing', address: @order.bill_address}
    end

    def shipping_form
        render partial: 'spree/address/form', locals: { form: "ship_address", address_type: 'shipping', address: @order.ship_address}
    end

    def use_billing_checked
        @order.shipping_eq_billing_address? ? "checked" : ""
    end

    def save_user_address_checked
        try_spree_current_user.respond_to?(:persist_order_address) ? "checked" : ""
    end
end
