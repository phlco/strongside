require 'spec_helper'

describe PokemonsController do

  describe "GET #index" do
    it "assigns all the pokemons to @pokemons" do
      pokemon = Pokemon.new
      pokemon.name = 'cooper'
      pokemon.species = 'cooper'
      pokemon.trainer_id = 1
      pokemon.save

      get :index

      pokemons_array = []
      pokemons_array << pokemon

      assigns(:pokemons).should match_array(pokemons_array)
    end

    it "renders index template" do
      get :index
      expect(response).to render_template( 'index' )
    end
  end

  describe "Get #show" do

    let(:pokemon) do
      Pokemon.create({
      name: 'cooper',
      species: 'cooper',
      trainer_id: 1 })
    end

    it "assigns trainer from params to @trainer" do
      get :show, id: pokemon.id
      assigns(:pokemon).should eq(pokemon) 
    end
    
    it "renders show template" do
      get :show, id: pokemon.id
      expect(response).to render_template('show')
    end
  end

end
