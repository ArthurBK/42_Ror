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

	def update
	@user = User.find_by_id(session[:user_id])
	@user.update(user_params) unless @user.nil?
	if @user && @user.save
		# session[:user_id] = @user.id
		redirect_to root_path, notice: "User #{@user.name} updated!"
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

	def user_params
		params.require(:user).permit(:name, :email, :password_digest)
	end

end
