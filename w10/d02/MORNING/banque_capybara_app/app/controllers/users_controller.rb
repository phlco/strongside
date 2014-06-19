class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(params[:user])
    redirect_to root_path, flash: { message: "Thanks for signing up" }
  end

  def show
    @user = User.find(session[:user_id])
  end
end
