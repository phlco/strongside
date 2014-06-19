class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :allow_cross_domain_access
  # def allow_cross_domain_access
  #   response.headers["Access-Control-Allow-Origin"] = "*"
  #   response.headers["Access-Control-Allow-Methods"] = "GET, PUT, POST, DELETE"
  # end

  after_filter :set_access_control_headers
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Credentials'] = 'true';
  end

end
