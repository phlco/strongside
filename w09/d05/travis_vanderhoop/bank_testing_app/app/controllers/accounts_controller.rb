class AccountsController < ApplicationController
  respond_to :json #sets all actions to respond to .json requests

  def index

  end

  def create
    binding.pry
    @account = Account.new
    @account.user_id = params[:user_id].to_i
    @account.balance = params[:account][:balance]
    if @account.save
      respond_with @account
    end
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy

  end
end
