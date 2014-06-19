require 'spec_helper'

describe Monster do

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
  # increases your health by 10 and your energy by up until you hit 100 at which point you cannot recover any more
  context "#recover" do
    before {
      @trainer = Trainer.create({
        email: "me@jonl.org",
        password: "kickhash",
        password_confirmation: "kickhash",
        })
      @monster = Monster.new({
        name: "Jon",
        species: "Pikachu",
        })
      @monster.trainer = @trainer
      @monster.save
      @trainer.save
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
      @monster1 = Monster.new({
        name: "Jon",
        species: "Pikachu",
        })
      @monster2 = Monster.new({
        name: "Mat",
        species: "Pikachu",
        })
      @monster1.trainer = @trainer
      @monster1.save
      @monster2.trainer = @trainer
      @monster2.save
      @trainer.save
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
      @monster1.attack(@monster2)
      @monster1.attack(@monster2)
      @monster1.attack(@monster2)
      @monster1.attack(@monster2)
      @monster1.attack(@monster2)
      @monster1.attack(@monster2)
      @monster1.attack(@monster2)
      @monster1.attack(@monster2)
      expect(@monster1.attack(@monster2)).to be_false
    end
  end

end

