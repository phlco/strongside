class AccountsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(params[:account])
    if @account.save
      redirect_to @account, notice: "Account was successfully created."
    else
      render "new"
    end
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      redirect_to @account, notice: "Account was successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    @account = Article.find(params[:id])
    @account.destroy
    redirect_to accounts_url
  end
end
