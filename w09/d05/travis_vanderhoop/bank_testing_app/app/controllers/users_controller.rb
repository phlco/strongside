class UsersController < ApplicationController
  respond_to :json #sets all actions to respond to .json requests

  def index
    # @messages = Message.all
    # # respond_to do |format|                  #this format does the same as the above, but for multiple types of requests
    # #   format.html
    # #   format.json ( render json: (hello: 'hi'))
    # # end
    # render json: Message.all?                 #
  end

  def show
    @accounts = current_user.accounts
  end

  def new
  end

  def create
    # @message = Message.create(params['message'])
    # respond_with @message                   #
  end

  def edit
  end

  def update
  end

  def destroy

  end
end
