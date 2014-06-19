class UsersController < ApplicationController

  def index
    # all the users
    users = User.all
    render json: users
  end

  def create
    raise
    # receive params for creation
  end

  def show
    # display specific user
  end

  def update
    # update the specific user in the db
  end

  def destroy
    # delete the specific user from the db
  end

end