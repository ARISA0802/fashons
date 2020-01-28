class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@addresses = @user.addresses
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
		params.require(:user).permit(:address,:name,:email,:topics_id[:address,:user_id,:_destroy])
	end

end
