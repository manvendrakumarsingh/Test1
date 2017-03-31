class PostsController < ApplicationController
 def index
		 @user = User.find_by(:id => params[:user_id])
		 @posts=Post.all 
		 render json: {:post => @posts, response: 200, responsemsg: "success"}
	end

   def show
   	 @user= user.find(params[:id])
      render json: {msg:"user post found", user: @user}
   end


	def create
		user = User.find(params[:user_id])
		 if user.blank?
			return render json: {response: 500,msg: "user not found"}
		end
        
		post = user.posts.build(post_params) 

		if post.save!
			render json: {response: 200,msg: "post Created Successfull", post: post}
		else
			render json: {response: 500,msg: "post Not Created"}
		end

	end
	def update
        user = User.find(params[:user_id])
        @post = user.post.find_by(params[:post_id])
        if posts.update(post_params)
               render json: {:post => "response code: 200, response message: Successfull"}
             
        else
                 render json: {:post => "response code: 400, response message: Bad Request"}
          end
    end      
		private 

        def post_params
			params.require(:post).permit(:name,:content)

end
end

