class EntriesController < ApplicationController

  def create
    Entry.create(message: params[:message])
    redirect_to about_path, flash: { :thanks => "Thank for Signing!" }
  end

end
