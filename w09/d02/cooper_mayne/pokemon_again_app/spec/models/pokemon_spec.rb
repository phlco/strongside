require 'spec_helper'

describe Pokemon do
  let(:pokemon) { Pokemon.new(name: "cooper", species: "sam") }
  
  context "when created" do
    let(:new_pokemon) { Pokemon.new }

    it "must have a name" do
      new_pokemon.valid?
      expect(new_pokemon).to have(1).error_on(:name)
    end

    it "must have a species" do
      new_pokemon.name = "cooper"
      new_pokemon.valid?
      expect(new_pokemon).to have(1).error_on(:species)
    end

    it "must have an trainer" do
      new_pokemon.valid?
      expect(new_pokemon).to have(1).error_on(:trainer)
    end

  end

  describe '#attack' do
    let(:pokemon_defender) { Pokemon.new(name: 'sam', species: 'lava') }
    
    it 'reduces victims health by 10' do
      pokemon.attack pokemon_defender
      expect(pokemon_defender.health).to eq(70)
    end

    it 'reduces energy by 10' do
      pokemon.attack pokemon_defender
      expect(pokemon.energy).to eq(70)
    end
  end

  describe "#recover" do
    it "has recover method which adds 10 hp" do
      pokemon.recover
      expect(pokemon.health).to eq 90
    end

    it "has max health of 100" do
      3.times { pokemon.recover }
      expect(pokemon.health).to eq 100
    end
  end

  context "after created" do
    it "has 80 health" do
      expect(pokemon.health).to eq 80
    end

    it "has 80 energy" do
      expect(pokemon.energy).to eq 80
    end

    it "will be destroyed when the owner is destroyed" do
      trainer = Trainer.new(email: 'jesus@son.god', password: '323232', 
                            password_confirmation: '323232') 
      pokemon.trainer = trainer
      pokemon.save
      trainer.destroy
      expect(Pokemon.exists?(pokemon.id)).to_not be
    end
  end

end
