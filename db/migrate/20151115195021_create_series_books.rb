class CreateSeriesBooks < ActiveRecord::Migration
  def change
    create_table :series_books do |t|
      t.string :title
      t.integer :year
      t.string :publisher
      t.text :review
      t.date :release
      t.integer :editions_number

      t.timestamps null: false
    end
  end
end
