class AddSeriesBookRefToComicBooks < ActiveRecord::Migration
  def change
    add_reference :comic_books, :series_book, index: true, foreign_key: true
  end
end
