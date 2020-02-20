class Users::TopicsController < ApplicationController
	
	def new
		@topix = Topix.new 
	end
	def create
		@topix = Topix.new(topix_params)
		if  @topix.save
			redirect_to user_topic_path(@topix.id)
		else
			render 'users/topics/new'
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
		topix = Topix.find(params[:id])
		if topix.update(topix_params)
			redirect_to user_topic_path
		else
			render "topix/edit"
		end
	end
	def destroy
		@topix = Topix.find(params[:id])
			@topix.destroy
			redirect_to user_topic_path
	end
	
	private
	
	def topix_params
		params.require(:topix).permit(:post_image,:title,:body)
	end

end
