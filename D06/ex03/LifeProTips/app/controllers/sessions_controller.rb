class SessionsController < ApplicationController
  require 'open-uri'

  def new() end

  def create
	user = User.authentificate(params[:email], params[:password_digest])
	if user
    session[:user_id] = user.id
    redirect_to root_url, notice: "Logged in as #{user.name}!"
	else
	  flash.now[:alert] = "Invalid Password!"
	  render :new
	end
  end

  def animal_name
  if cookies[:name].nil?
    url = "https://www.randomlists.com/random-animals"
	doc = Nokogiri::HTML(open(url))
    animal = doc.css('li').first.css('span').text
    cookies[:name] = {value: animal, expires: 1.minute.from_now}
  end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end

  def home
    animal_name
    @posts = Post.all
  end
end