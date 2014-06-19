class MonstersController < ApplicationController

  def index
    @monsters = Monster.all
  end

  def show
  end
end
