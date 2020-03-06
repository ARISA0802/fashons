class Admin::ManagerProductsController < ApplicationController
	skip_before_action :method_name, raise: false
	def new
		@rain = Rain.new 
	end
	def index 
		@rains = Rain.all
	end

	def show
	end
	def create
		@rain = Rain.new(rain_params)
		@rain.user_id = current_admin.id
		if @rain.save
			flash[:notice] = "You have created FASHON successfully."
		redirect_to admin_manager_products_path(@rain.id)
		else
			render :new
		end
	end

	def edit
		@rain = Rain.find(params[:id])
	end
	def update
		@rain = Rain.find(params[:id])
		if @rain.update(update_rain_params)
			redirect_to admin_manager_products_path
			else
				render :edit
		end
	end
	def destroy
		@rain = Rain.find(params[:id])
		@rain.destroy
		redirect_to admin_manager_products_path
	end
	private

	def rain_params
		params.require(:rain).permit(:sunny_image,:sunnyname,:sunnyintroduction,:rain_image,:coordinate_method,:name,:introduction )
	end
	def update_rain_params
		params.require(:rain).permit(:sunny_image,:sunnyname,:sunnyintroduction,:rain_image,:coordinate_method,:cloudy_image,:introduction,:name,:_destroy )
	end
end
