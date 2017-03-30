class LikesController < ApplicationController
	def index
		 @user = User.find_by(:id => params[:user_id])
		 @likes = @user.likes.all 
			render json: {:like => @likes, response: 200, responsemsg: "success"}
	end

	def create
		user = User.find(params[:user_id])
		 if user.blank?
			return render json: {response: 500,msg: "user not found"}
		end
        
		 user_like = user.like.build(like_params) 

		if like_params.save
			render json: {response: 500,msg: "like Created", like: like_params}
		else
			render json: {response: 500,msg: "like Not Created"}
		end
	end
		private 

        def like_params
			params.require(:like).permit(:status,:likable_type,:likable_id)

end
end
