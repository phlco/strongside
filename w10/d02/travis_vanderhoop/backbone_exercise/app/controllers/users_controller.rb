class UsersController < ApplicationController
  respond_to :json #sets all actions to respond to .json requests

  def index
    @users = User.all

    # render :json => @users
  end

  def show
    @user = User.find(params[:id])
    render :json => @user
  end

  def create
    @user = User.create(params['id'])
    respond_with @user
  end

  def update
    binding.pry
    # @user = User.updateAttr
  end

  def destroy
    binding.pry
    @user = User.find(params[:id])
    @user.destroy
  end
end
