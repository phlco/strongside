require 'spec_helper'

describe MonstersController do

  describe 'GET #index' do
    it "renders the index view" do
      get :index
      response.should render_template :index
    end

    it "assigns all the monsters as @monsters" do
      # get all the trainers
      # @trainers -> [<Trainer1>, <Trainer2>]

      trainer = Trainer.new
      trainer.password = "kickhash"
      trainer.password_confirmation = "kickhash"
      trainer.email = "kick@hash.com"
      trainer.save

      monster = Monster.new
      monster.name = "Pikachu"
      monster.trainer_id = 1
      monster.save

      get :index

      monsters_array = []
      monsters_array << monster

      # assigns(:monsters).should match_array(monsters_array)
      expect(assigns(:monsters)).to match_array(monsters_array)
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
