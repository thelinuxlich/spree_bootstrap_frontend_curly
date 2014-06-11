class Spree::Checkout::Payment::GatewayPresenter < Spree::CommonPresenter

    presents :payment_method
    presents :order

    def credit_card_image
        image_tag 'credit_cards/credit_card.gif', :id => 'credit-card-image', :class => 'pull-right'
    end

    def param_prefix
        "payment_source[#{@payment_method.id}]"
    end

    def payment_method_id
        @payment_method.id
    end

    def name_on_card_value
        "#{@order.billing_firstname} #{@order.billing_lastname}"
    end

    def cvv_link
        link_to "(#{Spree.t(:what_is_this)})", spree.content_path('cvv'), :target => '_blank', "data-hook" => "cvv_link", :id => "cvv_link"
    end
end
