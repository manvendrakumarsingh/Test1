class PostsController < ApplicationController
 def index
		@user = User.find_by(:id => params[:user_id])
		@posts=@user.posts.all 
			render json: {:post => @posts, response: 200, responsemsg: "success"}
	end

	def create
		user = User.find(params[:user_id])
		 if user.blank?
			return render json: {response: 500,msg: "user not found"}
		end
        
		user_posts = user.posts.build(post_params) 

		if user_posts.save
			render json: {response: 500,msg: "Event Created", events: user_posts}
		else
			render json: {response: 500,msg: "Event Not Created"}
		end
	end
		private 

        def post_params
			params.require(:post).permit(:name,:content)

end
end

