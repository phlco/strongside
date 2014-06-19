class TrainersController < ApplicationController

  def index

    @trainers = Trainer.all

  end

  def show
    @trainer = Trainer.find_by_id(params[:id])

  end

  def new
    @trainer = Trainer.new
  end

  def create
    if @trainer = Trainer.create(params[:trainer])
      redirect_to @trainer
    else
      render :new
    end
  end

  def edit
    @trainer = Trainer.find_by_id(params[:id])
  end

end
