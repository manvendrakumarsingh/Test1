class LikesController < ApplicationController
	def index
		# @user = User.find_by(:id => params[:user_id])
		 @likes = Like.all 
		# @likes = @comment.likes.all 
			render json: {:like => @likes, response: 200, responsemsg: "success"}
	end

	def create
		@post= Post.find(params[:user_id])
		 if @post.blank?
			return render json: {response: 500,msg: "user not found"}
		end
        
		 @likes = @post.likes.build(like_params) 

		if @likes.save
			render json: {response: 200,msg: "like Created", like: @likes}
		else
			render json: {response: 500,msg: "like Not Created"}
		end
	end
		private 

        def like_params
			params.require(:like).permit(:status,:likable_type,:likable_id,:user_id)

end
end
