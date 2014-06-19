class AccountsController < ApplicationController
  def new
    @account = Account.new
  end
  def create
    account = Account.new(params[:account])
    account.user_id = session[:user_id]
    @user = User.find(session[:user_id])
    @user.accounts << account
    redirect_to @user
  end
end