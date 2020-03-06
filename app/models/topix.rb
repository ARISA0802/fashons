class Topix < ApplicationRecord
	attachment :post_image
	validates :title, presence: true
	validates :body, length: {minimum:1, maximum: 200}
	validates :post_image, presence: true
end
