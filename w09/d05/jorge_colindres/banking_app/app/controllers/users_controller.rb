class UsersController < ApplicationController
  before_filter :authorize, only: [:show, :index, :edit]
  before_filter :correct_user, only: [:show, :index, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_path, :notice => "Success. You can now log in."
    else
      render action: "new"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def deposit
    @user = User.find(params[:id])
  end

  def do_deposit
    user = User.find(params[:id])
    bank_account = BankAccount.find(params[:account])
    deposit_amount = params[:amount].to_d
    bank_account.make_deposit(deposit_amount)
    if bank_account.save
      redirect_to user_path(user), method: 'get', :notice => 'Deposit complete.'
    else
      render :deposit, alert: 'Error. Please try again.'
    end
  end
end
