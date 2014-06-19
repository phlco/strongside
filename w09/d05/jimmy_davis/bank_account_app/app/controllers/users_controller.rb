class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(params[:user])
    render :json => @user
  end

end
