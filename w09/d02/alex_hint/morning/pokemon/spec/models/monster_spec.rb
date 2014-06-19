require 'spec_helper'

describe Monster do

  it "when they are born their health start at 80" do
    monster = Monster.new
    expect(monster.health).to eq 80
  end

  it "when they are born their energy also starts at 80" do
    monster = Monster.new
    expect(monster.energy).to eq 80
  end

  it "can not save without a name" do
    monster = Monster.new
    monster.trainer_id = 43
    expect(monster.save).to be_false
  end

  it "can save with a name" do
    monster = Monster.new
    monster.name = "Pokkeeeee"
    monster.species = "whatever"
    monster.trainer_id = 43
    expect(monster.save).to be_true
  end

  it "can not save without species" do
    monster = Monster.new
    monster.name = "Pokkeeeee"
    monster.trainer_id = 43
    expect(monster.save).to be_false
  end

  it "can save with species" do
    monster = Monster.new
    monster.name = "Pokkeeeee"
    monster.species = "whatever"
    monster.trainer_id = 43
    expect(monster.save).to be_true
  end

  it "must belong to a trainer" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "kick@hash.com"
    trainer.name = "Alex"
    trainer.save
    monster = Monster.new
    monster.name = "Pokkeeeee"
    monster.species = "fire"
    monster.trainer_id = trainer.id
    monster.save
    expect(monster.trainer_id).to eq trainer.id
  end

  it "can not exists without a trainer" do
    monster = Monster.new
    monster.name = "Pokkeeeee"
    monster.species = "fire"
    expect(monster.save).to be_false
  end

  it "will be the destroyed if the trainer it belongs to is destroyed"

end
