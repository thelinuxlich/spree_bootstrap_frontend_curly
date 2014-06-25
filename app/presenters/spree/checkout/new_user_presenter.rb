class Spree::Checkout::NewUserPresenter < Spree::CommonPresenter

  presents :user

  def registration_url
    spree.registration_path(@user)
  end

  def user_form
    render partial: 'spree/shared/user_form', locals: {user: @user}
  end
end
