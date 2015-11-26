class User < ActiveRecord::Base
  GENDER = %w(Masculino Feminino)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                             default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: ['image/jpeg',
                                                            'image/gif',
                                                            'image/png']

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
