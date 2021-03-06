class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_path, alert: "Not logged in" if current_user.nil?
  end

  def correct_user
    if params[:user_id].present?
      user = User.find params[:user_id]
    else
      user = User.find params[:id]
    end

    unless current_user == user
      redirect_to user_path(current_user), :alert => "Not your account"
    end
  end
end
