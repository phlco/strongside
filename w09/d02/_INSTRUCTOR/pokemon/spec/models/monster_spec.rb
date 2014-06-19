require 'spec_helper'

describe Monster do

  it "has a name error when the name is not set" do
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
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "me@jonl.org"
    trainer.save

    monster = Monster.new
    monster.trainer = trainer
    monster.valid?
    expect(monster.errors).to_not have_key(:trainer_id)
  end

  it "can be created when a name, species, and trainer set" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "me@jonl.org"
    trainer.save

    monster = Monster.new
    monster.trainer = trainer
    monster.name = "Jon"
    monster.species = "Pikachu"
    expect(monster.save).to be_true
  end

  it "will be destroyed when the owner is destroyed" do
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

    trainer.destroy

    expect(Monster.exists?(monster.id)).to be_false
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
