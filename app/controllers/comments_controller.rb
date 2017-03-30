class CommentsController < ApplicationController

	def create
    @comment =@post.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save
    if @comment.save
    	render json: {response: 500,msg: "commentcomment Created", comment: comment}
      else
      	render json: {response: 500,msg: "comment Not Created"}

	end
end




private
def find_post
	@post Post.find(params[:post_id])



end
