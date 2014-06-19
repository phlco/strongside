class CustomersController < ApplicationController
  def show
    @customer = Customer.find(session[:customer_id])
    @account = Account.new
  end
  def new
    @customer = Customer.new
  end
  def create
    @customer = Customer.create(params[:customer])
    @customer.save
    redirect_to('/')
  end
  def edit
    @account = Account.find(params[:account_id])
    @customer = Customer.find(session[:customer_id])
  end
end