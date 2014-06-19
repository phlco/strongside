require 'spec_helper'

describe Monster do

  let(:trainer) do
    Trainer.create(
      password: "kickhash",
      password_confirmation: "kickhash",
      email: "oynickj@gmail.com"
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

  it "does not have a name error when the name is set" do
    monster.name = "Pikachu"
    expect(monster).to have(0).error_on(:name)
  end

  it "invalid without a trainer_id" do
    expect(monster).to have(1).error_on(:trainer_id)
  end

  it "is valid with a trainer_id" do
    monster.trainer = trainer
    monster.valid?
    expect(monster.errors).to_not have_key(:trainer_id)
  end

  it "can be created when a name, species, and trainer set" do
    monster.trainer = trainer
    monster.name = "Josh"
    monster.species = "Pikachu"
    expect(monster.save).to be_true
  end

  context "when newly created" do

    let(:monster) do
      monster = Monster.new
      monster.trainer = trainer
      monster.name = "Josh"
      monster.species = "Pikachu"

      monster
    end

    it "has starting health of 80" do
      expect(monster.health).to be(80)
    end

    it "has starting energy of 80" do
      expect(monster.energy).to be(80)
    end

  end

  describe '#heal' do

    let(:monster) do
      monster = Monster.new
      monster.trainer = trainer
      monster.name = "Josh"
      monster.species = "Pikachu"

      monster
    end

    context "affects health by" do

      it "increases by 10 v2" do
        monster.health = 80
        monster.recover
        expect(monster.health).to be(90)
      end

      it "increases by 10 v2" do
        monster.health = 80
        expect { monster.recover }.to change { monster.health }.by(10)
      end

      it "increases by 20 when called twice" do
        monster.health = 80
        monster.recover #90
        monster.recover #100
        expect(monster.health).to be(100)
      end

      it "only increases health to 100" do
        monster.health = 100
        monster.recover
        expect(monster.health).to be(100)
      end

      it "does not increase if it is already at 100" do
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
        species: "Charmander"
      )

      @trainer2 = Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "ash@ketchum.com"
      )

      @defender = Monster.create(
        trainer_id: @trainer2.id,
        name: "Bulb",
        species: "Bulbasaur"
      )
    end

    context("when the attacker has enough energy") do

      before(:each) do
        @attacker.energy = 80
        @attacker.health
      end

      it "attacker's energy decreases by 10" do
        expect { @attacker.attack(@defender) }.to change { @attacker.energy }.by(-10)
      end

      it "defender's health decreases by 10" do
        expect { @attacker.attack(@defender) }.to change { @defender.health }.by(-10)
      end

    end

    context("attacker does not have enough energy") do

      before(:each) do
        @attacker.energy = 5
        @defender.health = 80
      end

      it "attacker's energy does not decrease" do
        expect { @attacker.attack(@defender) }.to change { @attacker.energy}.by(0)
      end

      it "the defender's health is not decreased" do
        expect { @attacker.attack(@defender) }.to change { @defender.health}.by(0)
      end

    end

  end

  describe "relationship with trainer" do
    context "trainer is destroyed" do

      it "trainer's monster destroyed as well" do
        monster = Monster.new
        monster.trainer = trainer
        monster.name = "Joe"
        monster.species = "Pikachu"
        monster.save

        trainer.destroy

        expect(Monster.exists?(monster.id)).to be_false
       end
     end

  end
end

# pokemon.recover increases your health by 10 up until you hit 100 and your energy by 10 up until you hit 100 at which you can't recover any more
# if your health was 80 and energy was 90, and ran recover, health 90 and energy 100, if you run again, health 100, energy 100

#pokemon attack

#   #initial conditions that do not let you create a monster, like if you don't have a name, species, owner
#   #you are able to create a pokemon given 3 attributes
#   #when you create a pokemon, check health is 80 and energy is 80
#   #when the owner is destroyed does the pokemon get destroyed as well

