class Comment < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
