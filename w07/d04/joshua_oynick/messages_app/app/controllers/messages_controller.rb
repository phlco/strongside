class MessagesController < ApplicationController

  def index

    respond_to do |format|
      format.html
      format.json {render :json => Message.all.to_json}
    end
  end

  def create
    new_message = Message.create(params[:message])

    respond_to do |format|
      format.json (render :json => new_message.to_json)
    end
  end

end
