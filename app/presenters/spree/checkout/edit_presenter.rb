class Spree::Checkout::EditPresenter < Spree::CommonPresenter

    presents :order
    presents :differentiator
    presents :payment_sources, default: nil

    def errors
        render partial: 'spree/shared/error_messages', locals: { target: @order }
    end

    def checkout_in_progress
        checkout_progress
    end

    def checkout_content_class
        @order.state != 'confirm' ? 'col-md-9' : 'col-md-12'
    end

    def checkout_form_id
        "checkout_form_#{@order.state}"
    end

    def update_checkout_url
        update_checkout_path(@order.state)
    end

    def order_email?
        @order.email?
    end

    def order(field)
        @order[field]
    end

    def order_state_form
        if(@order.state == "delivery")
            render partial: @order.state, collection: @order.shipments, as: "shipment", locals: {order: @order, differentiator: @differentiator}
        else
            render partial: @order.state, locals: {order: @order, payment_sources: @payment_sources}
        end
    end

    def order_state_confirm?
        @order.state == 'confirm'
    end

    def summary
        render partial: 'summary', locals: { order: @order }
    end

    def l10n_js_script
        if I18n.locale != :en
            raw("<script src='#{assets_prefix}/jquery.validate/localization/messages_#{I18n.locale}.js'></script>")
        end
    end
end
