class Spree::Address::FormPresenter < Spree::CommonPresenter

  presents :address_type
  presents :address

  def address_type
    @address_type
  end

  def address_dom_id(field)
    "#{address_id}#{field}"
  end

  def address(field)
    @address[field]
  end

  def address_id
    @address_type.chars.first
  end

  def company?
    Spree::Config[:company].present?
  end

  def address_requires_state?
    Spree::Config[:address_requires_state]
  end

  def countries
    available_countries
  end

  def state_elements
    select = "<select #{!have_states ? 'disabled' : ''} name='address[state_id]' class='#{have_states ? 'form-control required' : 'form-control hidden'}'><option value=''></option>"
    @address.country.states.each do |s|
      select << "<option value='#{s.id}'>#{s.name}</option>"
    end
    select << "</select>"
    input = "<input #{have_states ? 'disabled' : ''} type='text' name='address[state_name]' class='#{!have_states ? 'form-control required' : 'form-control hidden'}'>"
    raw [select + input].join.gsub('"', "'").gsub("\n", "")
  end

  def alternative_shipping_phone?
    Spree::Config[:alternative_shipping_phone].present?
  end

  private
  def have_states
    !@address.country.states.empty?
  end

  class CountryPresenter < Spree::CommonPresenter

    presents :country
    presents :address

    def id
      @country.id
    end

    def name
      @country.name
    end

    def is_selected
      @address.country_id == id ? "selected" : ""
    end
  end
end
