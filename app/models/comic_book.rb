class ComicBook < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' },
                            default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: ['image/jpeg',
                                                           'image/png',
                                                           'image/gif']

  belongs_to :series_book
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
end
