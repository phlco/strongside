class WelcomeController < ApplicationController

  def index
  end
  def about
    @entries = Entries.all
  end
  def thanks
    @entry = Entries.new
    @entry.messages = params[:Guestbook]
    @entry.save
  end


end
