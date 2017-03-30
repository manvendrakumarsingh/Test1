class UsersController < ApplicationController
	 def index
     @user = User.all
     render json: {:user => @user}
   end
	def new
      @user = User.new
  end
    def show 
    end
   #user user
     def create 
     @user = User.new(user_params) 

     if @user.save
      session[:user_id] = @user.id 
     
     render json: {:create =>"Successfull" }
     
    else
     
     render json: {:create => "Could not be saved"}
  end
end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,:gender,:image)
  end

  
end

