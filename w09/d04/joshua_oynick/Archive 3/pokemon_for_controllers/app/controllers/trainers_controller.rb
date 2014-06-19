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

    if @trainer.update_attributes(params[:trainer])
      redirect_to @trainer
    else
      render :edit
    end
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.destroy

    redirect_to trainers_path
  end

end
