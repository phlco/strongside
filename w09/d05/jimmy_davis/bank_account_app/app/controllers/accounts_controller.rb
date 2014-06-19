class AccountsController < ApplicationController

  def create
    Account.create(name: params[:name])
    redirect_to root_path
  end

end
