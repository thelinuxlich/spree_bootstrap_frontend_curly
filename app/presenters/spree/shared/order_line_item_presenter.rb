class Spree::Shared::OrderLineItemPresenter < Spree::CommonPresenter

    presents :item

    def small_image_variant_link
        if @item.variant.images.length == 0
            link_to small_image(@item.variant.product), @item.variant.product
        else
            link_to image_tag(@item.variant.images.first.attachment.url(:small)), @item.variant.product
        end
    end

    def variant_name
        @item.variant.product.name
    end

    def variant_description
        truncated_product_description(@item.variant.product)
    end

    def variant_options
        "(" + @item.variant.options_text + ")" unless @item.variant.option_values.empty?
    end

    def single_money
        @item.single_money.to_html
    end

    def quantity
       @item.quantity
    end

    def display_amount
        @item.display_amount.to_html
    end
end
