class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :likes
  has_many :comments
  has_many :followers, class_name: 'User', foreign_key: 'follower_id'

  def follow!(follower)
    return false if follower.id == id

    followers << follower
  end
end
