class Spree::Layouts::SpreeApplicationPresenter < Spree::CommonPresenter

    presents :body_id, default: 'default'
    presents :taxon, default: nil
    presents :searcher, default: nil

    def head
        render partial: 'spree/shared/head'
    end

    def header
        render partial: 'spree/shared/header', locals: {taxon: @taxon, searcher: @searcher}
    end

    def taxon_breadcumbs
        breadcrumbs(@taxon)
    end

    def sidebar
        render partial: 'spree/shared/sidebar'
    end

    def sidebar?
        content_for?(:sidebar)
    end

    def messages
        flash_messages
    end

    def content
        yield
    end

    def templates
        yield :templates
    end

    def footer
        render partial: 'spree/shared/footer'
    end

    def google_analytics
        render partial: 'spree/shared/google_analytics'
    end

    def app_key
        raw("<script>Spree.api_key = #{raw(try_spree_current_user.try(:spree_api_key).to_s.inspect)};</script>")
    end

    def sidebar_exists?(class1,class2)
        sidebar? ? class1 : class2
    end
end
