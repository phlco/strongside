require 'spec_helper'

describe TrainersController do

  describe 'GET #index' do

    it "assigns all the trainers as @trainers" do
      # get all the trainers
      # @trainers -> [<Trainer1>, <Trainer2>]

      trainer = Trainer.new
      trainer.password = "kickhash"
      trainer.password_confirmation = "kickhash"
      trainer.email = "kick@hash.com"
      trainer.save

      get :index

      trainers_array = []
      trainers_array << trainer

      assigns(:trainers).should eq(trainers_array)
    end

  end
  # index


  # show
  # new
  # edit
  # update
  # create
  # destroy

end