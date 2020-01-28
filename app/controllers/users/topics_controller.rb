class Users::TopicsController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user,only:[:edit, :update]

	def new
		@topix = Topix.new
	end
	def create
		@topixes = Topix.all
		@topix = Topix.new(topix_params)
		if @topix.save
			redirect_to users_topics_path
		else
			render 'topics/index'
		end
	end
	def index
		@topixes = Topix.all
		@topix = Topix.new
	end
	def show
		@topix = Topix.find(params[:id])
	end
	def edit
		@topix = Topix.find(params[:id])
	end
	def update
		@topix = Topix.find(params[:id])
			@topix.update(topix_params)
			redirect_to users_topics_path
	end
	def destroy
		topix = Topix.find(params[:id])
			topix.destroy
			redirect_to users_topics_path
	end
	def comment
    	@comment = Comment.new(comment: params[:comment], topix_id: params[:topix_id], user_id: params[:user_id])
    	@comment.save
    	redirect_to :action => "show", :id => @comment.topix_id
  end
	private
	def correct_user
		user=User.find(params[:user_id])
		if current_user!=user
			redirect_to user_topic_path(user_id: current_user.id)
		end
	end
	
	def topix_params
		params.require(:topix).permit(:title,:body)
	end
	def correct_user
		@topix = Topix.find(params[:id])
		if @topix.user_id != current_user.id
			redirect_to users_topics_path
		end
	end	
end
