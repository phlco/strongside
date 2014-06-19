class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end
  def show
    @user = User.where(id: params[:id].to_i).first
    render json: @user
  end
  def new
    @user = User.new
  end
  def create
    @user = User.create(params[:user])
  end
  def update
    @user = User.where(id: params[:id].to_i).first
    @user.update_attributes(params[:user])
  end
  def destroy
    @user = User.where(id: params[:id].to_i).first
    @user.destroy
  end
end