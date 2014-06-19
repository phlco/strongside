require 'spec_helper'

describe MonstersController do

  #index
  describe "GET #index" do

    it "should render index" do
    get :index
      response.should render_template :index
    end
    #get all the monsters
    it "assigns all the monsters as @monster" do
      ash = Trainer.create({name: "ash", password: "kickhash", password_confirmation: "kickhash", email: "kick@hash.com"})
      monster = Monster.new({name: "pikachu", species: "pikachu"})
      monster.trainer = ash
      monster.save

      get :index
      assigns(:monsters).should eq([monster])

    end



  end

  #show


  #new
  #create
  #edit
  #update
  #destroy




end
