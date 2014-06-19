class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = (params[:user][:name])
    @user.save
    flash[:notice] = "Welcome, " + @user.name
    redirect_to :root
  end

end
