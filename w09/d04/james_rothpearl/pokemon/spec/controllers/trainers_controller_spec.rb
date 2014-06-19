require 'spec_helper'

describe TrainersController do

  describe 'GET #index' do

    it "renders the index view" do
      get :index

      # response.should render_template :index
      expect(response).to render_template :index

    end


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

      # assigns(:trainers).should match_array(trainers_array)
      expect( assigns(:trainers) ).to match_array(trainers_array)
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
