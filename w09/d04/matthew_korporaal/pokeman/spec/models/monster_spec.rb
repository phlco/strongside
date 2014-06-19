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

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:trainer_id) }


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

  # Exact same thing for species
  # increases your health by 10 and your energy by up until you hit 100 at which point you cannot recover any more
  context "#recover" do
    before {
      @trainer = Trainer.create({
        email: "me@jonl.org",
        password: "kickhash",
        password_confirmation: "kickhash",
        })
      @monster = Monster.create({
        trainer_id: @trainer.id,
        name: "Jon",
        species: "Pikachu",
        })
    }

    it "should gain 10 points of energy&health for each recover" do
      @monster.recover
      expect(@monster.energy).to eq(90)
      expect(@monster.health).to eq(90)
    end

    it "should not gain more than 100 pts of energy or health" do
      @monster.recover
      @monster.recover
      @monster.recover
      expect(@monster.energy).to eq(100)
      expect(@monster.health).to eq(100)
    end

  end

  context "#attack" do
    before {
      @trainer = Trainer.create({
        email: "me@jonl.org",
        password: "kickhash",
        password_confirmation: "kickhash",
        })
      @monster1 = Monster.create({
        name: "Jon",
        species: "Pikachu",
        trainer_id: @trainer.id
        })
      @monster2 = Monster.create({
        name: "Mat",
        species: "Pikachu",
        trainer_id: @trainer.id
        })
    }
    it "should decrease health -10 to victim" do
      @monster1.attack(@monster2)
      expect(@monster2.health).to eq(70)
    end

    it "should decrease energy -10 of attacker" do
      @monster1.attack(@monster2)
      expect(@monster1.energy).to eq(70)
    end

    it "should not be able to attack if energy < 10" do
      10.times { @monster1.attack(@monster2) }
      expect(@monster1.attack(@monster2)).to be_false
    end
  end

end

