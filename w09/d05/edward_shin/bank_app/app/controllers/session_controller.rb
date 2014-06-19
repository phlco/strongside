class SessionController < ApplicationController

  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    @user = User.where(email: email).first
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now.alert = "invalid email or password"
      render :new
    end
  end

end