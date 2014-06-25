class Spree::Users::ShowPresenter < Spree::CommonPresenter

  presents :user
  presents :orders

  def user(field)
    @user[field]
  end

  def user_title
    accurate_title
  end

  def edit_user_link
    link_to Spree.t(:edit), spree.edit_account_path
  end

  def orders?
    @orders.present?
  end

  def orders
    @orders
  end

  class OrderPresenter < Spree::CommonPresenter
    presents :order

    def order_number_link
      link_to @order.number, order_url(@order)
    end

    def order_completed_date
      localize @order.completed_at.to_date
    end

    def order_state
      Spree.t("order_state.#{@order.state}").titleize
    end

    def payment_state
      Spree.t("payment_states.#{@order.payment_state}").titleize if @order.payment_state
    end

    def shipment_state
      Spree.t("shipment_states.#{@order.shipment_state}").titleize if @order.shipment_state
    end

    def total
      @order.display_total
    end
  end
end
