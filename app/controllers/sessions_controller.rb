class SessionsController < ApplicationController
	def new
	end
  #login
	def create
  @user = User.find_by_email(params[:session][:email])
  if @user && @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    render json:{:user =>"response: 200,response message:Successfull"}
  else
    flash.now.alert ="email or password is invalid"
   render json: {:user =>"response: 400,response message:Bad Request" }
  end
end
#logout

def destroy 
  session[:user_id] = nil
   redirect_to user_url, :notice => "Logged out Successfull"
end
end