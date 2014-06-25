class Spree::Shared::FilterLabelPresenter < Spree::CommonPresenter

  presents :label
  presents :filter

  def label
    label_obj
  end

  def name
    @label[0]
  end

  def filter_scope
    @filter[:scope].to_s
  end

  def value
    @label[1]
  end

  def label_checked
    params[:search] ||= {}
    params[:search][@filter[:scope]] && params[:search][@filter[:scope]].include?(@label[1].to_s) ? "checked" : ""
  end

  private
  def label_obj
    "#{@filter[:name]}_#{@label[0]}".gsub(/\s+/, '_')
  end

end
