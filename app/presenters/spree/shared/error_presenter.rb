class Spree::Shared::ErrorPresenter < Spree::CommonPresenter

    presents :error

    def msg
        @error
    end
end
