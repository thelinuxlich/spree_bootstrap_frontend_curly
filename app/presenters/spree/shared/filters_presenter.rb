class Spree::Shared::FiltersPresenter < Spree::CommonPresenter

    presents :taxon

    def setup!
        params[:search] ||= {}
    end

    def filters?
        filters = filters_obj
        filters.present?
    end

    def hidden_field_per_page
        hidden_field_tag 'per_page', params[:per_page]
    end

    def filters
        filters = filters_obj.reject {|f| f[:labels].blank? && f[:conds].blank? }
        render partial: "spree/shared/filter", collection: filters, as: "filter"
    end

    private
    def filters_obj
        @taxon ? @taxon.applicable_filters : [Spree::Core::ProductFilters.all_taxons]
    end
end
