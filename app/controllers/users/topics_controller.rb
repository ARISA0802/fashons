class Users::TopicsController < ApplicationController

	def new
		@topix = Topix.new
	end
	def create
		@topixes = Topix.all
		@topix = Topix.new(topix_params)
		if @topix.save
			redirect_to user_topic_path
		else
			render 'topics/index'
		end
	end
	def index
		@topixes = Topix.all.page(params[:page]).reverse_order

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
			redirect_to users_topics_path(@topix.id)
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
		params.require(:topix).permit(:title, :body, :post_image)
	end
	def update_params
		params.require(:topix).permit(:title, :body, :post_image,:_destroy)
	end
end
