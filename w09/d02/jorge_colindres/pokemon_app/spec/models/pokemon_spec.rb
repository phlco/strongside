require 'spec_helper'

describe Pokemon do

  context "prevent newly created blank pokemons against validations" do
    let(:poke) do
      poke = Pokemon.new
    end

    it "must belong to a trainer" do
      poke.valid?
      expect(poke.errors).to have_key(:trainer_id)
    end

    it "must have name" do
      poke.valid?
      expect(poke.errors).to have_key(:name)
    end

    it "must have species" do
      poke.valid?
      expect(poke.errors).to have_key(:species)
    end
  end

  context "verify default values of newly created blank pokemons" do
    let(:poke) do
      poke = Pokemon.new
    end

    it "has a default health of 80" do
      expect(poke.health).to eq(80)
    end

    it "has a default energy of 80" do
      expect(poke.energy).to eq(80)
    end
  end

  describe "#recover" do
    it "should increase health by 10" do
      poke = Pokemon.create(name: "Thomas", species: "gator", trainer_id: 1)
      poke.recover
      expect(poke.health).to eq(90)
    end

    it "cannot have energy greater than 100" do
      poke = Pokemon.create(name: "Thomas", species: "gator", trainer_id: 1)
      poke.recover
      poke.recover
      poke.recover
      expect(poke.energy).to eq(100)
    end

    it "cannot have health greater than 100" do
      poke = Pokemon.create(name: "Thomas", species: "gator", trainer_id: 1)
      poke.recover
      poke.recover
      poke.recover
      expect(poke.health).to eq(100)
    end
  end

  describe "#attack" do
    let(:poke) do
      poke = Pokemon.create(name: "Thomas", species: "gator", trainer_id: 1)
    end

    let(:poke2) do
      poke2 = Pokemon.create(name: "Billy", species: "gator", trainer_id: 2)
    end

    it "should lower energy by 10" do
      poke.attack(poke2)
      expect(poke.energy).to eq(70)
    end

    it "can only attack if it has energy of at least 10" do
      poke.energy = 1
      expect(poke.attack(poke2)).to be_false
    end

    it "should lower the victims health by 10" do
      poke.attack(poke2)
      expect(poke2.health).to eq(70)
    end
  end

  context "pokemon's trainer deleted" do
    it "should be destroyed when its trainer is destroyed" do
      trainer = Trainer.create(email: "test@test.net", password: "testing", password_confirmation: "testing", name: "Guy")
      poke = trainer.pokemons.create(name: "Thomas", species: "gator")
      trainer.destroy
      expect(Pokemon.exists?(poke)).to be_false
    end
  end

end
