class TrainersController < ApplicationController
  # index
  def index
    @trainers = Trainer.all
  end

  # show
  def show
    trainer_id = params[:id]
    @trainer = Trainer.find(trainer_id)
  end

  # new
  def new
    @trainer = Trainer.new
  end

  # edit
  def edit
    trainer_id = params[:id]
    @trainer = Trainer.find(trainer_id)
  end

  # create
  def create
    @trainer = Trainer.new(params[:trainer])
      if @trainer.save
        redirect_to @trainer
      else
        render :new
      end
  end

  # post
  # update
  # destroy
end
