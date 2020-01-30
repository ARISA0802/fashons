class Topix < ApplicationRecord
	belongs_to :user 
	attachment :post_image
	validates :title, presence: true
	validates :body, length: {minimum:1, maximum: 200}
end
