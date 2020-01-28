class Rain < ApplicationRecord
	attachment :rain_image
	attachment :sunny_image
	has_many :favorites,dependent: :destroy

    def favorite_user(id)
    	favorite.find_by(user_id: id)
    end

end
