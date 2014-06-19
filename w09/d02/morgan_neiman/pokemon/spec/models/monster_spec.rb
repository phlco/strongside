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

  it "it has a name error when the name is not set" do
    monster = Monster.new
    monster.valid?
    expect(monster.errors).to have_key(:name)
  end

  it "does not have a name error when the name is set" do
    monster = Monster.new
    monster.name = "Pikachu"
    monster.valid?
    expect(monster.errors).to_not have_key(:name)
  end

  it "has a trainer_id error when the trainer is not set" do
    monster = Monster.new
    monster.valid?
    expect(monster.errors).to have_key(:trainer_id)
  end

  it "is does not have a trainer error when the monster has a trainer" do
    monster.trainer = trainer
    monster.valid?
    expect(monster.errors).to_not have_key(:trainer_id)
  end

  it "can be created when a name, species, and trainer set" do
    monster.trainer = trainer
    monster.name = "Jon"
    monster.species = "Pikachu"
    expect(monster.save).to be_true
  end

  it "will be destroyed when the owner is destroyed" do
    monster.trainer = trainer
    monster.name = "Jon"
    monster.species = "Pikachu"
    monster.save

    trainer.destroy

    expect(Monster.exists?(monster.id)).to be_false
  end

  context "when newly created" do

    it "has a starting health of 80" do
      expect(monster.health).to be(80)
    end

    it "has a starting energy of 80" do
      expect(monster.energy).to be(80)
    end

  end

  describe '#heal' do

    let(:monster) do
     monster = Monster.new
     monster.trainer = trainer
     monster.name = "Jon"
     monster.species = "Pikachu"

     monster
   end

   it "increases health by 10" do
    monster.health = 80
    expect{ monster.recover }.to change { monster.health }.by(10)
   end

   it "can recover only up to 100" do
    monster.recover

    expect(monster.health).to eq(90)
    expect(monster.energy).to eq(90)

    monster.recover
    monster.recover

    expect(monster.health).to eq(100)
    expect(monster.energy).to eq(100)

  end

end


it "can attack if energy is over 0" do
  trainer = Trainer.new
  trainer.password = "kickhash"
  trainer.password_confirmation = "kickhash"
  trainer.email = "me@jonl.org"
  trainer.save

  monster = Monster.new
  monster.trainer = trainer
  monster.name = "Jon"
  monster.species = "Pikachu"
  monster.save

  monster2 = Monster.new
  monster2.trainer = trainer
  monster2.name = "shit"
  monster2.species = "some other shit"
  monster2.save

  monster.attack(monster2)

  expect(monster.energy).to eq(70)
  expect(monster2.health).to eq(70)

  monster.energy = 0
  monster.attack(monster2)
  expect(monster.energy).to eq(0)
  expect(monster2.health).to eq(70)

end
  # Exact same thing for species



  # Initial Conditions that initially
    # - do not let you create a monster
      # -name
      # -species
      # -owner
    # - you are able to create a pokemon given the 3 above things
      # - and that when you do create a pokemon
        # -health is 80
        # - energy is also 80
  # When the owner is destoryed, does the pokemon get destroyed as well


end
