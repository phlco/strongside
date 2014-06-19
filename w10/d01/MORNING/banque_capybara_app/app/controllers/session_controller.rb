class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path, flash: { message: "Welcome Back" }
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
