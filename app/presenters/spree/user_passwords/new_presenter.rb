class Spree::UserPasswords::NewPresenter < Spree::CommonPresenter

  presents :spree_user

  def errors
    render partial: 'spree/shared/error_messages', locals: {target: @spree_user}
  end

  def reset_password_path
    spree.reset_password_path
  end

  def user(field)
    @spree_user[field]
  end
end
