class ProgrammersController < ApplicationController

  def index
  end

  def all
    @programmers = Programmer.all
  end

  def single
    id = params[:id]
    programmer = Programmer.find(id)
    @name = programmer.name
    @username = programmer.twitter_username
    @pic = programmer.twitter_pic
  end

  def edit
    id = params[:id]
    @programmer = Programmer.find(id)
  end

  def update
    id = params[:id]
    programmer = Programmer.find(id)
        # programmer.update_attributes(params.slice([]))

    programmer.name = params[:name]
    programmer.twitter_username = params[:twitter_username]
    programmer.twitter_pic = params[:twitter_pic]
    programmer.github_username = params[:github_username]
    programmer.save
    redirect_to("/programmers/#{id}")
  end

end
