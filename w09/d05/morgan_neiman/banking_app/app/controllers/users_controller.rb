class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:current_user] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Sorry, that information was invalid. Did your password and password confirmation match?"
      render :new
    end
  end
  def show
    @user = User.where(id: params[:id].to_i).first
  end
end