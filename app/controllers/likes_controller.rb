class LikesController < ApplicationController
	def index
		@user = User.find_by(:id => params[:user_id])
		@likes=@user.likes.all 
			render json: {:post => @likes, response: 200, responsemsg: "success"}
	end

	def create
		user = User.find(params[:user_id])
		 if user.blank?
			return render json: {response: 500,msg: "user not found"}
		end
        
		like_params = user.posts.build(like_params) 

		if like_params.save
			render json: {response: 500,msg: "Event Created", like: like_params}
		else
			render json: {response: 500,msg: "Event Not Created"}
		end
	end
		private 

        def like_params
			params.require(:like).permit(:status,:likable_id)

end
end
