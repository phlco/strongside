class BankAccountsController < ApplicationController
  def index
    @bank_accounts = BankAccount.where(user_id: params[:user_id]).first
    render :json => @bank_accounts
  end

  def new
    @user = User.find(params[:user_id])
    @bank_account = BankAccount.new
  end

  def create
    user = User.find(params[:user_id])
    bank_account = BankAccount.new(params[:bank_account])
    bank_account.user = user

    if bank_account.save
      redirect_to user_bank_account_path(user, bank_account), :notice => "New account created"
    else
      redirect_to :back, alert: "Error, try again."
    end
  end

  def show
    @bank_account = BankAccount.find(params[:id])
  end

  def update

  end
end
