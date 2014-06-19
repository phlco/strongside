require 'spec_helper'

describe MonstersController do

  describe "GET #index" do
    it "directs to the view" do
      get :index
      # response.should render_template :index
      expect(response).to render_template :index
    end
    it "returns an array of monsters" do
      monster = Monster.new
      monster.name = "Jon"
      monster.species = "Pikachu"
      monster.trainer_id = 1
      monster.save
      get :index
      monsters_array = []
      monsters_array << monster
      # assigns(:monsters).should match_array(monsters_array)
      expect(assigns(:monsters)).to match_array(monsters_array)
    end
  end
  describe "GET #show" do
    let(:monster){Monster.create(name: "sparky", species: "poodle", email: "me@jonl.org")}
    it "directs to show view" do
      get :show, id: 1
      expect(response).to render_template :show
    end
    it "assigns the"
  end

end
