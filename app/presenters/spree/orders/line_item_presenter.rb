class Spree::Orders::LineItemPresenter < Spree::CommonPresenter

  presents :line_item
  presents :order

  def variant_image
    if variant.images.length == 0
      link_to small_image(variant.product), variant.product
    else
      link_to image_tag(variant.images.first.attachment.url(:small)), variant.product
    end
  end

  def variant_product_link
    link_to @line_item.name, product_path(variant.product)
  end

  def variant_options
    variant.options_text
  end

  def line_item_on_insufficient_stock_lines?
    @order.insufficient_stock_lines.include? @line_item
  end

  def line_item_description
    line_item_description_text(@line_item.description)
  end

  def line_item_single_money
    @line_item.single_money.to_html
  end

  def line_item(field)
    @line_item[field]
  end

  def total
    @line_item.display_amount.to_html unless @line_item.quantity.nil?
  end

  def delete_line_item_link
    link_to image_tag('icons/delete.png'), '#', :class => 'delete', :id => "delete_#{dom_id(@line_item)}"
  end

  private
  def variant
    @line_item.variant
  end
end
