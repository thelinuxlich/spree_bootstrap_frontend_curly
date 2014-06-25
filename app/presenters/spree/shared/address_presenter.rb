class Spree::Shared::AddressPresenter < Spree::CommonPresenter

  presents :address

  def full_name
    @address.full_name
  end

  def company?
    @address.company.present?
  end

  def company
    @address.company
  end

  def address1
    @address.address1
  end

  def address2?
    @address.address2.present?
  end

  def address2
    @address.address2
  end

  def city
    @address.city
  end

  def state
    @address.state_text
  end

  def zipcode
    @address.zipcode
  end

  def country
    @address.country.try(:name)
  end

  def phone?
    @address.phone.present?
  end

  def phone
    @address.phone
  end

  def alternative_phone?
    @address.alternative_phone.present?
  end

  def alternative_phone
    @address.alternative_phone
  end
end
