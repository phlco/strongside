class AccountsController < ApplicationController
  before_filter :users_accounts, on: [:show, :deposit]

  def index
  end

  def new
    @account = @user.accounts.new
  end

  def create
    @user.accounts.create(params[:account])
    redirect_to dashboard_path
  end

  def show
    @account = Account.find(params[:id])
  end

  def deposit
    account = Account.find(params[:account_id])
    amount = params[:amount].to_d
    render json: account.deposit(amount)
  end

  def withdraw
    from_account = Account.find(params[:account_id])
    amount = params[:amount].to_d
    memo = params[:memo]
    if params[:transactionType] == "transfer"
      to_account = Account.find(params[:toAccount])
      @user.transfer(amount, from_account, to_account, memo)
      render json: { status: 200 }
    else
      render json: from_account.withdraw(amount, memo)
    end
  end
end
