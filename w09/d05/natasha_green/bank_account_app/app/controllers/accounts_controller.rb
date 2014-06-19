class AccountsController < ApplicationController


  def index
    @accounts = Account.find_all_by_user_id(params[:user_id])
    #This is telling the account model to look for the account with that specific
    #user id
    @user = User.find(params[:user_id])
  end

  def new

  end

  def show
    @account = Account.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def create
    binding.pry
    if params[:commit] == "deposit"
      amount = current_user.deposit(params[:amount].to_i)
    end
  end

  def update
  end

  def destroy
  end


end
