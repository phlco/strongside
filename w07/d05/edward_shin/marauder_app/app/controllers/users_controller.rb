class UsersController < ApplicationController

  def index
    @users = User.all
        respond_to do |format|
      format.html
      format.json {render :json => @users}
    end
  end

  def create

    @user = User.create(params[:user])
    respond_to do |format|
      format.html
      format.json {render :json => @user}
    end

  end


end