class ProductsController < ApplicationController
	def index
		now_month = Time.now.month
		@code = Code.new
		@codes = Code.all
	
	end
	def show
	end

	private
	def code_params
		params.require(:code).permit(:image)
	end

end
