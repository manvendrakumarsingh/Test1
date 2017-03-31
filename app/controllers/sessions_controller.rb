class SessionsController < ApplicationController
	def new
	end
  #login
  def create
	     user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: {:user_id => user[:id], responsecode: 200, message: "Successfully logged in"}
    else
        flash.now.alert = "email or password is invalid"
        render json: {responsecode: 400, responsemessage: "Bad Request"}
    end
end
def destroy
    session[:user_id] = nil
    redirect_to users_url, notice: 'logged out'
 
end
end