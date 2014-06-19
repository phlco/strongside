require 'spec_helper'

  # let(:monster) {
  #   Monster.new({
  #     energy: 80,
  #     health: 80,
  #     name: "Pikachi",
  #     species: "electricity",
  #     trainer_id: 1
  #   })
  # }

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

  it "does not have a trainer error when the monster has a trainer" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "me@jonl.org"
    trainer.save

    monster = Monster.new
    # this will test for the relationship as well!
    monster.trainer = trainer
    monster.valid?
    expect(monster.errors).to_not have_key(:trainer_id)
  end

  it "can be created when a species, name and trainer set" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "me@jonl.org"
    trainer.save

    monster = Monster.new
    # this will test for the relationship as well!
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

  let(:trainer){
      Trainer.new({
        email: "kick@hash.org",
        password: "kickhash",
        password_confirmation: "kickhash"
      })
    }

  let(:monster){
      Monster.new({
        name: "Pikachu",
        species: "Pika",
        health: 80,
        energy: 80,
        trainer_id: trainer.id
      })
    }


  let(:monster2){
      Monster.new({
        name: "Squirtle",
        species: "Turtle",
        health: 80,
        energy: 80,
        trainer_id: trainer.id
      })
    }

  it "can recover 10 hp and energy with the recover method" do
    monster.recover
    expect(monster.health).to eq (90)
    expect(monster.energy).to eq (90)
  end

  it "can attack and take away 10hp from opponent and lose 10 energy points" do
    monster.attack(monster2)
    expect(monster2.health).to eq (70)
    expect(monster.energy).to eq (70)
  end

end



