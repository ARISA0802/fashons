class UsersController < ApplicationController
	skip_before_action :require_admin_login, raise: false
	def show
		
		@user = User.find(params[:id])
		@favorites = Favorite.where(user_id: @user.id)
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@users.id)
		else
			render :edit
		end
	end
	def index
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:address,:name,:email,:topix [:address,:user_id,:_destroy])
	end
	def topix_params
		params.require(:topix).permit(:title,:body)
	end

end
