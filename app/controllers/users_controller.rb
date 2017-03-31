class UsersController < ApplicationController
	 def index
     @user = User.all
     render json: {:user => @user}
   end
	def new
      @user = User.new
  end
    def show
      @user= User.find(params[:id])
      render json: {msg:"user found", user: @user}
    end
     
    
      def home

         @user= User.find_by(id: params[:home][:user_id])
         @posts = @user.posts.all
         render json: {response: 200, user: @user, post: @posts}
end



   


   #user user
    def create
    user = User.new(user_params)
     
    if user.save
        # session[:user_id] = user.id
      
        render json: {:user_id => user[:id], responsecode: 200, responsemessage: "Successfully"}
    else
        render json: { responsecode: 400, responsemessage: "Bad Request"}
    end
end

  private

    def home_params
      params.require(:home).permit(:user_id)
  end

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,:gender,:image)
  end

  
end

