class ProductsController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user,only:[:edit, :update]

	def index
		@rains = Rain.all.order("id DESC").page(params[:page]).per(24)
		@rain = Rain.new
	end
	def show
		@rain = Rain.find(params[:id])
		@favorite = Favorite.new
		@all_rank = 0
		@all_ranks = Rain.find(Favorite.group(:rain_id).order('count(rain_id) desc').limit(12).pluck(:rain_id))
		@all_ranking = Rain.find(Favorite.group(:rain_id).order('count(rain_id) desc').limit(30).pluck(:rain_id))

	end

	private
	def rain_params
		params.require(:rain).permit(:rain_image,:coordinate_method,:name,:introduction,:sunny_image,:sunnyintroduction,:content)
	end
	def correct_user
		@rain = Rain.find(params[:id])
		if @rain.user_id != current_user.id
			redirect_to products_path
		end
	end

end
