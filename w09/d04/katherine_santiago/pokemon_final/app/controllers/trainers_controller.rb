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

  def edit
    @trainer = Trainer.find(params[:id])
  end

  def create
    @trainer = Trainer.new(params[:trainer])
    if @trainer.save
      redirect_to @trainer
    else
      render :new
    end

    redirect_to @trainer
  end

  def update
    @trainer = Trainer.find(params[:id])
    @trainer.update_attributes(params[:trainer])
    if @trainer.update_attributes(params[:trainer])
      redirect_to @trainer
    else
      redirect_to :edit
    end
  end

  def delete
  end


end