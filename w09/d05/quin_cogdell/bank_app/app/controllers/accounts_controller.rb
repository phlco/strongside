class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params[:account])
    @account.save
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end


end
