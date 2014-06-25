class Spree::Shared::SidebarPresenter < Spree::CommonPresenter
  def sidebar
    yield :sidebar
  end
end
