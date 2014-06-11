class Spree::Users::EditPresenter < Spree::CommonPresenter

    presents :user

    def errors
        render partial: 'spree/shared/error_messages', locals: { target: @user }
    end

    def user_path
        spree.user_path(@user)
    end

    def user_form
        render partial: 'spree/shared/user_form', locals: {f: @user}
    end
end
