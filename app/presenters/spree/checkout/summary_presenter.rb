class Spree::Checkout::SummaryPresenter < Spree::CommonPresenter

    presents :order

    def total
        @order.display_item_total.to_html
    end

    def line_item_adjustments?
        @order.line_item_adjustments.exists?
    end

    def promotion_adjustments
        @order.all_adjustments.promotion.eligible.group_by(&:label)
    end

    def tax_adjustments
       @order.all_adjustments.tax.eligible.group_by(&:label)
    end

    def checkout_steps_delivery?
        @order.checkout_steps.include?("delivery") && @order.shipments.any?
    end

    def shipment_total?
        @order.shipment_total > 0
    end

    def shipment_total
        Spree::Money.new(@order.shipment_total).to_html
    end

    def eligible_adjustments?
        @order.adjustments.eligible.exists?
    end

    def eligible_adjustments
        @order.adjustments.eligible.reject { |a| (a.source_type == 'Spree::TaxRate') and (a.amount == 0)}
    end

    def order_total
        @order.display_total.to_html
    end

    class EligibleAdjustmentPresenter < Spree::CommonPresenter

        presents :eligible_adjustment

        def label
            @eligible_adjustment.label
        end

        def total
            @eligible_adjustment.display_amount.to_html
        end
    end

    class TaxAdjustmentPresenter < Spree::CommonPresenter

        presents :tax_adjustment

        def label
            @tax_adjustment[0]
        end

        def total
            Spree::Money.new(@tax_adjustment[1].sum(&:amount)).to_html
        end
    end

    class PromotionAdjustmentPresenter < Spree::CommonPresenter

        presents :promotion_adjustment

        def label
            @promotion_adjustment[0]
        end

        def total
            Spree::Money.new(@promotion_adjustment[1].sum(&:amount)).to_html
        end
    end
end
