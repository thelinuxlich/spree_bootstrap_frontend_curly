class Spree::Shared::TaxonomyPresenter < Spree::CommonPresenter

  presents :taxon
  presents :taxonomy

  def name
    Spree.t(:shop_by_taxonomy, :taxonomy => @taxonomy.name)
  end

  def taxonomy_tree
    taxons_tree(@taxonomy.root, @taxon, Spree::Config[:max_level_in_taxons_menu] || 1)
  end
end
