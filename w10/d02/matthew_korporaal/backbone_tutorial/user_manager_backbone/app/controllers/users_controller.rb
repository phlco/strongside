class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new({
      firstname: params[:firstname],
      lastname: params[:lastname],
      age: params[:age].to_i
      })
    if user.save
      render json: user
    else
      render json: user.errors
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.errors
    end
  end

  def update
    user = User.find(params[:id])
    updated_params = {
      firstname: params[:firstname],
      lastname: params[:lastname],
      age: params[:age].to_i
    }
    if User.update(user, updated_params)
      render json: {  status: "ok" }
    else
      render json: user.errors
    end
  end

  def destroy
    if User.destroy(params[:id])
      render :json => {  status: "ok" }
    else
      render json: @user.errors
    end

  end
end