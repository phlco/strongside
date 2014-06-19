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
      render 'new'
    end
  end

  def destroy
    Trainer.delete(params[:id])
    redirect_to '/trainers'
  end

  def update
    #binding.pry
    @trainer = Trainer.find(params[:id])
    if @trainer.update_attributes(params[:trainer])
      redirect_to '/trainers'
    else
      render action: 'edit'
    end
  end
end
