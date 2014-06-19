class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.create(params[:user])
    render json: @user
  end

  def show
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      format.json do
        @user.update_attributes(params[:user])
        render json: @user
      end
    end
  end


  def destroy
  end
end