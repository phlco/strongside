class TrainersController < ApplicationController

  def index
    @trainers = Trainer.all
  end

  def show
    trainer_id = params[:id]
    @trainer = Trainer.find(trainer_id)
  end

  def new
    @trainer = Trainer.new
  end

  def edit
    trainer_id = params[:id]
    @trainer = Trainer.find(trainer_id)
  end

  def create
    @trainer = Trainer.new(params[:trainer])
    if @trainer.save
      redirect_to @trainer
    else
      render :new
    end
  end

  def update
    @trainer = Trainer.find(params[:id])
    redirect_to @trainer
  end

end