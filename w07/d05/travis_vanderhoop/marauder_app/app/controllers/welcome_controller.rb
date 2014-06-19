class WelcomeController < ApplicationController

  def index
  end

  def create
    binding.pry
    @user = User.create(params[:user])
  end

end
