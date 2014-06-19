class TransfersController < ApplicationController
  def new

  end
  def create
    @transfer = Transfer.new
    if params[:Kind].downcase == "withdrawal"
      @transfer.amount = params[:Amount].to_i
      @transfer.account_id = params[:account_id]
      @transfer.kind = "Withdrawal"
      if @transfer.save
        @account = Account.where(id: params[:account_id].to_i).first
        @account.money -= params[:Amount].to_i
        flash[:notice] = "Withdrawal Successful!"
        redirect_to @account
      else
        flash[:notice] = "Invalid submission."
        render :new
      end
    elsif params[:Kind].downcase == "deposit"

    elsif params[:Kind].downcase == "transfer"
    else
      flash[:notice] = "Invalid submission."
      render :new
    end
  end
end