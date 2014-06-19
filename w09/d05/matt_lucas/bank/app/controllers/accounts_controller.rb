class AccountsController < ApplicationController

  def show
    @account = Account.find(params[:account_id])
  end

  def create
    @account = Account.create(params[:account])
    @account.customer_id = current_user.id
    @account.save
    redirect_to("/customers/#{params[:customer_id]}")
  end

  def edit
    @customer = Customer.find(session[:customer_id])
    @account = Account.find(params[:id])
  end

  def update
    @customer = Customer.find(session[:customer_id])
    @account = Account.find(params[:id])
    @account.balance = @account.balance + params[:account][:amount].to_f
    @account.save
    redirect_to("/customers/#{params[:customer_id]}")
  end

  def show
    @customer = Customer.find(session[:customer_id])
    @account = Account.find(params[:id])
  end
end