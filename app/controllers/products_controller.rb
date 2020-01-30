class ProductsController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user,only:[:edit, :update]

	def index
		@rains = Rain.all
		@rain = Rain.new
	end
	def show
		@rain = Rain.find(params[:id])
		@favorite = Favorite.new
		

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
