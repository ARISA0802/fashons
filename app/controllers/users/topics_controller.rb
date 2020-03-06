class Users::TopicsController < ApplicationController
	def new
		@topix = Topix.new 
	end
	def create
		topix = Topix.new(topix_params)
		if topix.save
			redirect_to users_topic_path(topix.id),notice:"topics was successfully created."
		else
			render 'users/topics/index'
		end
	end
	def index
		@topixes = Topix.all
	end
	def show
		@topix = Topix.find(params[:id])
	end

	def edit
		@topix = Topix.find(params[:id])
	end
	def update
		@topix = Topix.find(params[:id])
		if @topix.update(topix_params)
			redirect_to user_topic_path
		else
			render "topix/edit"
		end
	end
	def destroy
		@topix = Topix.find(params[:id])
		@topix.destroy
		redirect_to users_topics_path
	end
	
	private
	
	def topix_params
		params.require(:topix).permit(:title,:body,:post_image)
	end

end
