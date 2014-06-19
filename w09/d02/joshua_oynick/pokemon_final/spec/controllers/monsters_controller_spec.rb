require 'spec_helper'

describe MonstersController do

  describe 'GET #index' do

    it "renders the index view" do
      get :index
      response.should render_template :index
    end

    it "assigns all the monsters as @monsters" do
      monster = Monster.new
      monster.name = "Josh"
      monster.species = "Pikachu"
      monster.trainer_id = 1
      monster.save

      get :index

      monsters_array = []
      monsters_array << monster

      expect( assigns(:monsters)).to match_array(monsters_array)
    end
  end
end
