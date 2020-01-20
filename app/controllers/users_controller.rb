class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end
	def edit
	end
	def update
	end
	def index
	end
	def destroy
	end

	private

	def user_params
		params.require(:user).permit(:name,:email,[:_destroy])
	end
	def correct_user
		user=User.find(params[:id])
		if current_user!=user
			redirect_to user_path(current_user)
		end
	end
end
