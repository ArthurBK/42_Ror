class Admin::UsersController < ApplicationController
before_action :check_admin

	def check_admin
	@admin = User.find_by_id(session[:user_id])
	if @admin.nil? || @admin.admin == false
	redirect_to root_path, notice: "You don't have the rights to access this page" 
	end
	end

	def index
		@users = User.all	
	end

	
	def update
		# byebug
	user = User.find_by_id(params[:id])
	 
	# unless @user.nil?
	if user && user.update(user_params)
		# session[:user_id] = @user.id
		redirect_to admin_users_path, notice: "User #{user.name} updated!"
	else
		render :edit
	end
	end

  	def edit
  	if session[:user_id].nil?
  		redirect_to root_path, notice: "Wrong url"
  	else
    	@user = User.find(params[:id])
    end
  	end

  	def destroy
  		user = User.find_by_id(params[:id])
  		user.destroy
  		redirect_to admin_users_path, notice: "User #{user.name} deleted!"
  	end

	def user_params
		params.require(:user).permit(:name, :email, :password_digest)
	end

end
