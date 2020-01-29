class FavoritesController < ApplicationController
	skip_before_action :require_admin_login, raise: false
	before_action :correct_user, only: [:index]

	def index
		@user = User.find(params[:user_id])
		@favorites = Favorite.where(user_id: @user.id).page(params[:page]).per(10)
	end
	def create

			@rain = Rain.find(params[:product_id])
            @favorite = current_user.favorites.new(rain_id: @rain.id)
            @favorite.save
            redirect_to user_favorites_path(current_user)
        end
    def destroy
    		@rain = Rain.find(params[:product_id])
            @favorite = current_user.favorites.find_by(rain_id: @rain.id)
            @favorite.destroy
            redirect_to user_favorites_path(current_user)
    end
    private

    def correct_user
    	user=User.find(params[:user_id])
    	if current_user!=user
    		redirect_to user_favorites_path(user_id: current_user.id)
    	end
    end

end 
