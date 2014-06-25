class Spree::Shared::FilterPresenter < Spree::CommonPresenter
  presents :filter

  def name
    @filter[:name]
  end

  def labels
    render partial: "spree/shared/filter_label", collection: labels_obj, as: "label", locals: {filter: @filter}
  end

  private
  def labels_obj
    @filter[:labels] || @filter[:conds].map { |m, c| [m, m] }
  end
end
