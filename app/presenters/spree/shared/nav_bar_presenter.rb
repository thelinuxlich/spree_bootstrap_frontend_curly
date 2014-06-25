class Spree::Shared::NavBarPresenter < Spree::CommonPresenter

  presents :searcher
  presents :taxon

  def search
    render partial: 'spree/shared/search', locals: {searcher: @searcher, taxon: @taxon}
  end

  def login_bar
    render partial: 'spree/shared/login_bar'
  end
end
