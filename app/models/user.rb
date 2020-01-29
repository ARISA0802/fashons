class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses
  has_many :rains, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :topix, dependent: :destroy
  has_many :favorited_rains, through: :favorites,source: :rain
 validates :address, presence: true
 def already_favorited?(rain)
 	self.favorites.exists?(rain_id: rain.id)
 end

end
