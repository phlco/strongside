class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user_params = params.slice(:firstname, :lastname, :age)
    render json: User.create(user_params)
  end

  def update
    user_params = params.slice(:firstname, :lastname, :age)
    render json: User.update(params[:id], user_params)
  end

  def destroy
    render json: User.destroy(params[:id])
  end

end
