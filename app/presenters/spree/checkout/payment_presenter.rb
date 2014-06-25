class Spree::Checkout::PaymentPresenter < Spree::CommonPresenter

  presents :payment_sources
  presents :order

  def payment_sources?
    @payment_sources.present?
  end

  def coupon_code
    @order["coupon_code"]
  end

  def payment_sources
    @payment_sources
  end

  def payment_methods
    @order.available_payment_methods
  end

  class PaymentMethodPresenter < Spree::CommonPresenter

    presents :payment_method
    presents :order

    def method_name
      Spree.t(@payment_method.name, :scope => :payment_methods, :default => @payment_method.name)
    end

    def method_id
      @payment_method.id
    end

    def method_id_checked
      @payment_method == @order.available_payment_methods.first ? "checked" : ""
    end

    def method_class
      @payment_method == @order.available_payment_methods.last ? "last" : ""
    end

    def payment_method_type
      render partial: "spree/checkout/payment/#{@payment_method.method_type}", locals: {payment_method: @payment_method, order: @order}
    end
  end

  class PaymentSourcePresenter < Spree::CommonPresenter

    presents :payment_source
    presents :payment_sources

    def payment_source_dom_id
      dom_id(@payment_source, 'spree')
    end

    def payment_source_class
      cycle('even', 'odd')
    end

    def name
      @payment_source.name
    end

    def display_number
      @payment_source.display_number
    end

    def month
      @payment_source.month
    end

    def payment_id
      @payment.id
    end

    def year
      @payment_source.year
    end

    def existing_card_checked
      (@payment_source == @payment_sources.first) ? "checked" : ""
    end
  end
end
