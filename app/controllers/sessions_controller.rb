class SessionsController < ApplicationController
  def new
  end
  def create
  	@user = User.find_by(email: params[:email])
  	if @user
  		if @user.authenticate(params[:password])
  			flash[:success] = "Sign in successfully."
  			session[:user_id] = @user.id
  			redirect_to root_path
  		else
  			flash.now[:error] = "Wrong password."
  			render 'new'
  			#deny_user
  		end
  	else
  		flash.now[:error] = "User not found"
  		render 'new'
  		#deny_user
  	end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: {success: "Logged Out"}
  end
end
