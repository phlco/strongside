class WelcomeController < ApplicationController
  def index
  end
  def about
    @entries = Entry.all
  end
end
