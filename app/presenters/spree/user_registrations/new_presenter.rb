class Spree::UserRegistrations::NewPresenter < Spree::CommonPresenter

    presents :body_id, default: nil
    presents :spree_user

    def setup!
        @body_id = 'signup'
    end

    def registration_path
        spree.registration_path(@spree_user)
    end

    def errors
        render partial: 'spree/shared/error_messages', locals: { target: @spree_user }
    end

    def update_password_path
        spree.update_password_path
    end

    def user_form
        render partial: 'spree/shared/user_form', locals: { f: @spree_user }
    end
end
