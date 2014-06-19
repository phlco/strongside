class SessionsController < ApplicationController
  def new

  end
  def create
    @user = User.find_by_email(params[:Email])
    if @user && @user.authenticate(params[:Password])
      session[:current_user] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Email or password is invalid"
      render :new
    end
  end
end