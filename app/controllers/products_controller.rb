class ProductsController < ApplicationController
	def index
		now_month = Time.now.month
		@rain = Rain.new
		@rains = Rain.all
	
	end
	def show
	end

	private
	def code_params
		params.require(:rain).permit(:rain_image,:coordinate_method,:name,:introduction)
	end

end
