class SessionsController < ApplicationController
  before_action :authenticate_user, :only => [:home, :profile, :setting]
  before_action :save_login_state, :only => [:login, :login_attempt]
  def login
    render "login"
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to "/welcome/index"
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"	
    end
  end

  # def create
  #   user = User.find_by_email(params[:email])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to root_url, notice: "Logged in!"
  #   else
  #     flash.now[:alert] = "Email or password is invalid"
  #     render "new"
  #   end
  # end

  # def home
  # end

  # def profile
  # end

  # def setting
  # end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
