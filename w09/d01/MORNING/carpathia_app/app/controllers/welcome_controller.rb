class WelcomeController < ApplicationController
  def index
  end

  def random
    random_user = User.where(:travel_class => params[:travel_class]).sample
    render json: random_user
  end
end
