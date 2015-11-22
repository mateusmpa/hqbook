class AddReviewToComicBooks < ActiveRecord::Migration
  def change
    add_column :comic_books, :review, :text
    add_column :comic_books, :publication_year, :date
    add_column :comic_books, :edition_number, :integer
  end
end
