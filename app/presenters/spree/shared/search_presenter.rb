class Spree::Shared::SearchPresenter < Spree::CommonPresenter

    presents :taxon

    def taxon
        @taxon && @taxon.parent ? @taxon.parent.children : Spree::Taxon.roots
    end

    def taxons_select
        taxons = taxon
        select_tag :taxon,
            options_for_select([[Spree.t(:all_departments), '']] +
                            taxons.map {|t| [t.name, t.id]},
                            @taxon ? @taxon.id : params[:taxon]), 'aria-label' => 'Taxon', class: "form-control"

    end
end
