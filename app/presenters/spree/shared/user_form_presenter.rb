class Spree::Shared::UserFormPresenter < Spree::CommonPresenter

    presents :f

    def email_value
        @f.email
    end

    def password_value
        @f.password
    end
end
