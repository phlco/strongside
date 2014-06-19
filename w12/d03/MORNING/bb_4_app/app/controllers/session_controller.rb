class SessionController < ApplicationController

  def new
  end

  def create
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user.to_json(except: :password_digest), status: 200
    else
      render json: {message: "can't login"}, status: 401
    end
  end

  def destroy
    reset_session
  end

  private
  def user
    User.where(email: params[:email]).first
  end
end
