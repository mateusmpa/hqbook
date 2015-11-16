class CreateSeriesBooks < ActiveRecord::Migration
  def change
    create_table :series_books do |t|
      t.string :title
      t.timestamps null: false
    end
  end
end
