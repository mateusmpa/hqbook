class AddAttachmentImageToSeriesBooks < ActiveRecord::Migration
  def self.up
    change_table :series_books do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :series_books, :image
  end
end
