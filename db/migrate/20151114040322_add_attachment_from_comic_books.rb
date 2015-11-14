class AddAttachmentFromComicBooks < ActiveRecord::Migration
  def change
    add_attachment :comic_books, :image
  end
end
