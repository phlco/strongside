class UsersController < ApplicationController
  # root        /                         users#index
  # users GET    /users(.:format)          users#index
  #     POST   /users(.:format)          users#create
  # new_user GET    /users/new(.:format)      users#new
  # edit_user GET    /users/:id/edit(.:format) users#edit
  # user GET    /users/:id(.:format)      users#show
  #     PUT    /users/:id(.:format)      users#update
  #     DELETE /users/:id(.:format)      users#destroy
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(params[:user])
    render json: @user
  end

  def new
    @user = User.new
    render json: @user
  end

  def edit
    @user = User.find(params[:id])
    render json: @user
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user
  end
end
