class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |format|
      format.json {render json: @users}
    end
  end

  def new
    @user = {name: nil, email: nil, lat: nil, lng: nil}
    respond_to do |format|
      format.json {render json: @user}
    end
  end

  def create
    @user = User.create(params[:user])
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

end
