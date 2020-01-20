class Admin::ManagerProductsController < ApplicationController
	skip_before_action :method_name, raise: false
	def new
		@office = Office.new
		@mode = Mode.new
		@casual = Casual.new
		@feminine = Feminine.new
		@code = Code.new
	end
	def index 
		@codes = Code.all

	end

	def show
	end
	def create
		@code = Code.new(code_params)
		if @code.save
			redirect_to new_admin_manager_product_path
		else
			@office = Office.new
			@mode = Mode.new
			@casual = Casual.new
			@feminine = Feminine.new
			render :new
		end
	end

	def edit
		@code = Code.find(params[:id])
	end
	def update
		@code = Code.find(params[:id])
		if @code.update(update_product_params)
			redirect_to admin_manager_products_path
		else
			render :edit
		end
	end
	def destroy
		@code = Code.find(params[:id])
		@code.destroy
		redirect_to admin_manager_products_path
	end
	private

	def code_params
		params.require(:code).permit(:coordinate_method,:casual_id,:mode_id,:feminine_id,:code_image)
	end
	def update_code_params
		params.require(:code).permit(:code_image,:coordinate_method,:casual_id,:mode_id,:feminine_id)
	end
end
