class UsersController < ApplicationController
  respond_to :json

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(params[:id])
    render json: @user
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    binding.pry
    # what is the format of the object sent to this route?  this is waht I was trying to figure out with the binding.pry
  end

  def destroy
    # to finish
    @user.destroy
  end

end


