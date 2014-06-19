class UsersController < ApplicationController
  def index
    @users = User.all.reverse

    render :json => @users
  end

  def create
    @user = User.new(params[:user])
    @user.save
    render :json => @user
  end

  def show
    @user = User.find(params[:id])
    render :json => @user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    render :json => @user
  end
end
