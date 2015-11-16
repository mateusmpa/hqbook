class AddImageColumnsToSeriesBook < ActiveRecord::Migration
  def change
    add_attachment :series_books, :image
  end
end
