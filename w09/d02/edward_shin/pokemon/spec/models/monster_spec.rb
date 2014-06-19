require 'spec_helper'

describe Monster do

  it "cannot be created without a trainer" do
    monster = Monster.new
    expect(monster).to_not be_valid
  end
  it "cannot be created without a name" do
    monster = Monster.new(trainer_id: 3)
    expect(monster).to_not be_valid
  end

  it "cannot be created without a species" do
    monster = Monster.new(name: "charzard", trainer_id: 1)
    expect(monster).to_not be_valid
  end

  it "is born with 80 health" do
    monster = Monster.new(name: "charzard", trainer_id: 1, species: "pokemon")
    expect(monster.health).to eq(80)
  end

  it "is born with 80 energy" do
    monster = Monster.new(name: "charzard", trainer_id: 1, species: "pokemon")
    expect(monster.energy).to eq(80)
  end
  it "has recover method to increase health by 10" do
    monster = Monster.new(name: "charzard", trainer_id: 1, species: "fire")
    monster.recover
    expect(monster.health).to eq(90)
  end
  it "has attack method which decrease opposing pokemon by 10 and decreases your energy by 10" do
    monster1 = Monster.new(name: "charzard", trainer_id: 1, species: "fire")
    monster2 = Monster.new(name: "blastoise", trainer_id: 2, species: "water")
    monster1.attack(monster2)
    expect(monster1.energy).to eq(70)
    expect(monster2.health).to eq(70)
  end
end
