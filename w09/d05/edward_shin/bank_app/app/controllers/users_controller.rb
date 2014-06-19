class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    redirect_to '/login'
  end

  def show
    user = User.find(session[:user_id])
    @accounts = user.accounts
  end

  def destroy
  end


end