class Spree::Shared::TaxonomiesPresenter < Spree::CommonPresenter

  presents :taxonomies
  presents :taxon

  def taxonomies?
    @taxonomies.present?
  end

  def taxonomies_list
    render partial: 'spree/shared/taxonomy', collection: @taxonomies, as: "taxonomy", locals: {taxon: @taxon}
  end
end
