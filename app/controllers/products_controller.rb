class ProductsController < ApplicationController
	def index
		@rain = Rain.new
		@rains = Rain.all
		@favorites = Favorite.new
	
	end
	def show
		@rain = Rain.find(params[:id])

	end

	private
	def code_params
		params.require(:rain).permit(:rain_image,:coordinate_method,:name,:introduction)
	end

end
