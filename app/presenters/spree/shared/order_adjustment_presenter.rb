class Spree::Shared::OrderAdjustmentPresenter < Spree::CommonPresenter

    presents :adjustment

    def label
        @adjustment.label
    end

    def total
        @adjustment.display_amount.to_html
    end
end
