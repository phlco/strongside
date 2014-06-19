class UsersController < ApplicationController
  respond_to :json #sets all actions to respond to .json requests

  def create
    @user = User.create(params['user'])
    respond_with @user
  end

  def update
    @user = User.find(params[:id])
    binding.pry
    @user.update_attributes(:latitude => params['user']['latitude'], :longitude => params['user']['latitude'])
  end

end
