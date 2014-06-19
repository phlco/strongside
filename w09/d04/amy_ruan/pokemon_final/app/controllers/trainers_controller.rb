class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(params[:trainer])
    if @trainer.save
      redirect_to @trainer
    else
      render :new
    end
  end

  def edit
    @trainer = Trainer.find(params[:id])
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
    @trainer.delete
    redirect_to trainers_path
  end
end