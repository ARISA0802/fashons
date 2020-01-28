class Admin::ManagersController < ApplicationController
	def index
		@users = User.all
		@user = current_user
	end
	def show
		@user=User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to admin_managers_path
		else
			render :edit
		end
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to  admin_managers_path
	end
	def create
	end
	private

	def user_params
		params.require(:user).permit(:name,:email,address: [:address,:user_id,:id,:_destroy])
	end
	def correct_user
		@user = Book.find(params[:id])
		if @user.user_id != current_user.id
			redirect_to admin_managers_path
		end
	end
end
