class Spree::UserPasswords::EditPresenter < Spree::CommonPresenter

    presents :spree_user

    def errors
        render partial: 'spree/shared/error_messages', locals: { target: @spree_user }
    end

    def update_password_path
        spree.update_password_path
    end

    def user(field)
        @spree_user[field]
    end
end
