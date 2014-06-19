require 'spec_helper'

describe Monster do

  let(:trainer) do
    Trainer.create(
      password: "kickhash",
      password_confirmation: "kickhash",
      email: "me@jonl.org"
    )
  end

  let(:monster) { Monster.new }

  it "is invalid without a name" do
    monster.valid?
    expect(monster.errors).to have_key(:name)
  end

  it "is invalid without a name v2" do
    expect(monster).to have(1).error_on(:name)
  end

  it "is not name erroring with a name" do
    monster.name = "Pikachu"
    expect(monster).to have(0).error_on(:name)
  end

  it "is invalid without a trainer_id" do
    expect(monster).to have(1).error_on(:trainer_id)
  end

  it "is valid with a trainer_id" do
    monster.trainer = trainer
    monster.valid?
    expect(monster.errors).to_not have_key(:trainer_id)
  end

  it "can be created when a name, species, and trainer are specified" do
    monster.trainer = trainer
    monster.name = "Jon"
    monster.species = "Pikachu"
    expect(monster.save).to be_true
  end

  context "when newly created" do

    let(:monster) do
      monster = Monster.new
      monster.trainer = trainer
      monster.name = "Jon"
      monster.species = "Pikachu"

      monster
    end

    it "has starting health of 80" do
      expect(monster.health).to be(80)
    end

    it "has starting energy of 80" do
      expect(monster.energy).to be(80) #TODO
    end

  end

  describe '#recover' do

    let(:monster) do
      monster = Monster.new
      monster.trainer = trainer
      monster.name = "Jon"
      monster.species = "Pikachu"

      monster
    end

    context "affects health by" do

      it "increasing it by 10" do
        monster.health = 80
        monster.recover
        expect(monster.health).to be(90)
      end

      it "increasing it by 10 (v2)" do
        monster.health = 80
        expect{ monster.recover }.to change { monster.health }.by(10)
      end

      it "increasing it by 20 when called twice" do
        monster.health = 80
        monster.recover # 90
        monster.recover # 100
        expect(monster.health).to be(100)
      end

      it "only increases health up until 100" do
        monster.health = 99
        monster.recover
        expect(monster.health).to be(100)
      end

      it "does not increase it if it is already at 100" do
        monster.health = 100
        monster.recover
        expect(monster.health).to be(100)
      end

    end

    context "affects energy by" do

      it "increasing it by 10" do
        monster.energy = Monster::START_ENERGY - 10
        monster.recover
        expect(monster.energy).to be(Monster::START_ENERGY)
      end

      it "increasing it by 10 (v2)" do
        monster.energy = Monster::START_ENERGY - 10
        expect{ monster.recover }.to change { monster.energy }.by(10)
      end

      it "increasing it by 20 when called twice" do
        monster.energy = Monster::START_ENERGY - 20
        monster.recover # 90
        monster.recover # 100
        expect(monster.energy).to be(Monster::START_ENERGY)
      end

      it "increasing it up until #{Monster::MAX_ENERGY}" do
        monster.energy = Monster::MAX_ENERGY-1
        monster.recover
        expect(monster.energy).to be(Monster::MAX_ENERGY)
      end

      it "not increasing it if it is already at #{Monster::MAX_ENERGY}" do
        monster.energy = Monster::MAX_ENERGY
        monster.recover
        expect(monster.energy).to be(Monster::MAX_ENERGY)
      end

    end

  end

  describe '#attack' do

    before(:each) do
      @trainer1 = Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "ash@ketchum.com"
      )

      @attacker = Monster.create(
        trainer_id: @trainer1.id,
        name: "Char",
        species: "Charmander",
      )

      @trainer2 = Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "brock@brock.com"
      )

      @defender = Monster.create(
        trainer_id: @trainer2.id,
        name: "Bulb",
        species: "Bulbasaur",
      )
    end

    context("when the attacker has enough energy") do

      before(:each) do
        @attacker.energy = 80
        @defender.health = 80
      end

      it "attacker's energy is decreased by 10" do
        expect { @attacker.attack(@defender) }.to change { @attacker.energy }.by(-10)
      end

      it "the defender's health is decreased by 10" do
        expect { @attacker.attack(@defender) }.to change { @defender.health }.by(-10)
      end

    end

    context("when the attacker does NOT have enough energy") do

      before(:each) do
        @attacker.energy = 5
        @defender.health = 80
      end

      it "attacker's energy is not decreased" do
        expect { @attacker.attack(@defender) }.to change { @attacker.energy }.by(0)
      end

      it "the defender's health is not decreased" do
        expect { @attacker.attack(@defender) }.to change { @attacker.energy }.by(0)
      end

    end

  end

  describe "relationship with trainer" do
    context "when the trainer is destroyed" do

      it "it's monster will be destoryed as well" do
        monster = Monster.new
        monster.trainer = trainer
        monster.name = "Jon"
        monster.species = "Pikachu"
        monster.save

        trainer.destroy

        expect(Monster.exists?(monster.id)).to be_false
      end
    end

  end
end
