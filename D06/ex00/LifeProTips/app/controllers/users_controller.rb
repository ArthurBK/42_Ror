class UsersController < ApplicationController

	def new
		@user = User.new
	end

	
	def create
		@user = User.new(user_params)
		params[:user][:name] = cookies[:name] unless params[:user][:name].present?
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Logged in as #{@user.name}!"
		else
			render :new
		end
	end

	def user_params
		params.require(:user).permit(:name, :email, :password_digest)
	end

end
