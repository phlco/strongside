class UsersController < ApplicationController
  def index
    users = User.all
  end

  def new
    @user = User.new
    first_class = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
    response = HTTParty.get(first_class)
    doc = Nokogiri::HTML(response)
    @passenger = []
    names = doc.css('.fn').each do |passenger|
      name = passenger.text.split(",")
      first_name = name[1]
      last_name = name[0].titleize
      new_name = first_name + " " + last_name
      @passenger.push(new_name)
    end

    # second_class = "http://www.encyclopedia-titanica.org/titanic-second-class-passengers/"
    # third_class = "http://www.encyclopedia-titanica.org/titanic-third-class-passengers/"
  end

  def create
    @user = User.create(params[:user])
  end

end