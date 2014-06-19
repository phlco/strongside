require 'spec_helper'

describe MonstersController do

  describe 'GET #index' do

    it "assigns all of the monsters as @monsters" do
      monster = Monster.new
      monster.name = "Travis"
      monster.species = "Humanoid"
      monster.trainer_id = 1
      monster.save

      get :index
      monsters_array = []
      monsters_array << monster
    end # assigns all of the monsters as @monsters

  end

end
