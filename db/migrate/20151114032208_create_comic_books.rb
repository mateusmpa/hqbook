class CreateComicBooks < ActiveRecord::Migration
  def change
    create_table :comic_books do |t|
      t.string :title
      t.timestamps null: false
    end
  end
end
