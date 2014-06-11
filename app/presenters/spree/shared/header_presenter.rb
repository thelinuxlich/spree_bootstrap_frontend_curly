class Spree::Shared::HeaderPresenter < Spree::CommonPresenter

    presents :searcher
    presents :taxon

    def nav_bar
        render partial: 'spree/shared/nav_bar', locals: {searcher: @searcher, taxon: @taxon}
    end

    def main_nav_bar
        render partial: 'spree/shared/main_nav_bar' if store_menu?
    end
end
