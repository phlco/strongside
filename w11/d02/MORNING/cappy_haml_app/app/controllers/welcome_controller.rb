class WelcomeController < ApplicationController
  def index
  end

  def quiz
  end

  def haml
  end

  def random
    number = params[:number].to_i
    array_of_random_numbers = []
    number.times { array_of_random_numbers << rand(-100..100).to_i }
    render json: array_of_random_numbers
  end
end
