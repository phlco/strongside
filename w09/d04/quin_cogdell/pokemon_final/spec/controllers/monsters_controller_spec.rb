require 'spec_helper'

describe MonstersController do

  describe "GET #index" do

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns all monsters to @monsters" do
      monster = Monster.new
      monster.name = "Quin"
      monster.trainer_id = 1
      monster.save

      get :index

      monsters_array = []
      monsters_array << monster

      expect(assigns(:monsters)).to match_array(monsters_array)
    end
  end

  describe "GET #show" do
    let(:monster) do
      Monster.create(
        name: "Quin",
        trainer_id: 1)
      end

    it "renders the show view" do
      get :show, id: monster.id
      expect(response).to render_template :show
    end

    # it "assigns the trainer to @trainer" do
    #   get :show, id: monster.id
    #   expect(assigns(:monster)).to eq(monster)
    # end

  end



end
