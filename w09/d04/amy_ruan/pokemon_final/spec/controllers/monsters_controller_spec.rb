require 'spec_helper'

describe MonstersController do
  it "renders the index view" do
    get :index
    response.should render_template :index
  end

  describe 'GET #index' do
    it "assigns all monsters as @monsters" do
      trainer = Trainer.create(password: "kickhash", password_confirmation: "kickhash", email: "kick@hash.com")

      monster = Monster.new
      monster.name = "pika"
      monster.species = "pikachu"
      monster.trainer_id = trainer.id
      monster.save

      get :index

      monsters_array = []
      monsters_array << monster

      assigns(:monsters).should eq(monsters_array)
    end
  end
end