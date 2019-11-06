module CsvimportersHelper

  # https://github.com/rails/rails/issues/26875
  def sortable(column, title = nil)
    title ||= column.titleize
  end

end
