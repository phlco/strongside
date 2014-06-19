class WelcomeController < ApplicationController
  def create
    user = User.where(user_name: params[:user_name]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(user)
    else redirect_to("/session/new")
    end
  end
  def new
    redirect_to "/accounts" if session[:user_id]
  end
end
