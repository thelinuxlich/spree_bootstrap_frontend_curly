class Spree::Payments::PaymentPresenter < Spree::CommonPresenter

    presents :payment

    def credit_card?
        source.is_a?(Spree::CreditCard)
    end

    def cc_type_img
        unless (cc_type = source.cc_type).blank?
            image_tag "credit_cards/icons/#{cc_type}.png"
        end
    end

    def source_name
        source.name
    end

    def source_last_digits
        "#{Spree.t :ending_in} #{source.last_digits}"
    end

    def payment_method_name
        @payment.payment_method.name
    end

    private
    def source
        @payment.source
    end
end
