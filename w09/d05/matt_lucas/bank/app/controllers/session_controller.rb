class SessionController < ApplicationController
  def new
  end

  def create
    customer = Customer.where(email: params[:email]).first
    if customer && customer.authenticate(params[:password])
      session[:customer_id] = customer.id
      redirect_to "/customers/#{customer.id}"
    else
      flash.now.alert = "Email or password is invalid"
      render :new
    end
  end

  def destroy
    session[:customer_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end