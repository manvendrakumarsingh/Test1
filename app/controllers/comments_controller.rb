class CommentsController < ApplicationController
		def index
		 @user = User.find_by(:id => params[:user_id])
		 @comments = @user.comments.all 
		 render json: {:comment => @comments, response: 200, responsemsg: "success"}
	end


	def create
         user = User.find(params[:user_id])
          if user.blank?
			return render json: {response: 500,msg: "user not found"}
		end
        
          user_comment = user.comments.build(comment_params)
          #@comment.user_id= current_user

         if user_comment.save
      	    render json: {response: 200,msg: "comment Created", comment: user_comment}
		else
			render json: {response: 500,msg: "comment Not Created"}
    end
  end
  def show
  end
def update
        user = User.find_by(params[:user_id])

        if user.comments.update(event_params)
               render json: {:event => "response code: 200, response message: Successfull"}
             
        else
                 render json: {:event => "response code: 400, response message: Bad Request"}
          end
    end      
         
    def destroy
        user = User.find_by(params[:user_id])
       
            if user.comments.destroy
               render json: {responsecode: 200, responsemessage: "Success"}
        else
              render json: {responsecode: 400, responsemessage: "Bad Request"}
          end
    end




private
#def find_post
#	@post Post.find(params[:post_id])
 def comment_params
			params.require(:comment).permit(:content,:post_id,:user_id)

end


end
