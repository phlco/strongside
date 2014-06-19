class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

  helper_method :current_user

  # def authorize
  #   redirect_to login_url, alert: "Not authorized" if current_user.nil?
  # end

end