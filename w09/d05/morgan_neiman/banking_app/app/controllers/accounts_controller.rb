class AccountsController < ApplicationController
  def new
    @account = Account.new
  end
  def create
    @account = Account.new(params[:account])
    @account.user_id = session[:current_user]
    if @account.save
      redirect_to "/users/#{session[:current_user]}"
    else
      redirect_to "/"
    end
  end
  def show
    @account = Account.where(id: params[:id].to_i).first
  end
  def destroy
    @account = Account.where(id: params[:id].to_i).first
    @account.destroy
    redirect_to "/users/#{session[:current_user]}"
  end
end