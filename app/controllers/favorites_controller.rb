class FavoritesController < ApplicationController
	skip_before_action :require_admin_login, raise: false
	before_action :correct_user, only: [:index]

	def index
		@user = User.find(params[:user_id])
		@favorites = Favorite.where(user_id: @user.id)page(params[:page]).per(10)
	def create
		@favorite = currentuser.favorites.create(rain_id: params[:rain_id])
		@rains = Rain.ll
    end
    def destroy
		favorite = current_user.favorite.find_by(rain_id: params[:rain_id])
    	favorite.destroy
    	@rains = Closet.all

    end
    private
    def set_rain
    	@rain = Rain.find(params[:closet_id])
  end

end
