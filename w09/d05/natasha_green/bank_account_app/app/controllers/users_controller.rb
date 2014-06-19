class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.find(params[:id])
  end


end
