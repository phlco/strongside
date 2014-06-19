class WelcomeController < ApplicationController
  def index
    @people = User.all
  end

  def data
    @data = {}
    (0..100).each { |key| @data[key] = 0 }

    people = User.all

    people.each do |person|
      @data[person.age] += 1
    end

    respond_to do |format|
      format.json { render :json => @data }
    end
  end
end
