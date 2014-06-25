class Spree::Checkout::RegistrationPresenter < Spree::CommonPresenter

  presents :user

  def errors
    render partial: 'spree/shared/error_messages', locals: {target: @user}
  end

  def new_user
    render partial: 'new_user'
  end

  def allow_guest_checkout?
    Spree::Config[:allow_guest_checkout].present?
  end

  def registration_error?
    flash[:registration_error].present?
  end

  def update_checkout_registration_url
    update_checkout_registration_path
  end

  def user(field)
    @user[field]
  end
end
