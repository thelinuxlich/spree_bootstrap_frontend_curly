class Spree::Shared::HeadPresenter < Spree::CommonPresenter
    def meta
        raw(meta_data_tags)
    end

    def canonical
        canonical_tag(Spree::Config.site_url)
    end

    def favicon
        favicon_link_tag image_path('favicon.ico')
    end

    def main_css
        stylesheet_link_tag 'spree/frontend/all', :media => 'screen'
    end

    def csrf
        csrf_meta_tags
    end

    def main_js
        javascript_include_tag 'spree/frontend/all'
    end

    def head
        yield :head
    end
end
