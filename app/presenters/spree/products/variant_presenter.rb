class Spree::Products::VariantPresenter < Spree::CommonPresenter
  presents :variant
  presents :variant_counter

  def price_display
    display_price(@variant)
  end

  def is_checked
    @variant_counter == 0 ? "checked" : ""
  end

  def variant_id
    @variant.id
  end

  def options
    variant_options @variant
  end

  def price?
    variant_price @variant
  end

  def price
    variant_price @variant
  end
end
