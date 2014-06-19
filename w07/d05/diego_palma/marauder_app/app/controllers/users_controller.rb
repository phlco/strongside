class UsersController < ApplicationController

  def index
    # @users = User.all

    #   respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @users }

  end

  def create
    @user = User.create(params[:user])

    respond_to do |format|
      format.json { render json: @users }
    end
  end


end
