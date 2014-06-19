require 'spec_helper'

describe Monster do

  let(:trainer) do
    Trainer.create(
      password: "kickhash",
      password_confirmation: "kickhash",
      email: "quincogdell@gmail.com"
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

  it "is does not have a name error with a name" do
    monster.name = "Pikachu"
    expect(monster).to have(0).error_on(:name)
  end

  it "is invalid without a trainer_id" do
    expect(monster).to have(1).error_on(:trainer_id)
  end

  it "is valid with a trainer_id" do
    monster.trainer = trainer
    expect(monster).to have(0).error_on(:trainer_id)
  end





  # it "is valid if it does have a name" do
  #   monster = Monster.new(name: "Quin")
  #   monster.valid?
  #   expect(monster.errors).to_not have_key(:name)
  # end

  # exact same tests for species as for name

  # it "does not have a trainer_id error when the trainer_id is set" do
  #   trainer = Trainer.new
  #   trainer.password = "kickhash"
  #   trainer.password_confirmation = "kickhash"
  #   trainer.email = "quincogdell@gmail.com"
  #   trainer.save

  #   monster = Monster.new
  #   monster.trainer = trainer
  #   monster.valid?
  #   expect(monster.errors).to_not have_key(:trainer_id)
  # end

  # it "has a trainer_id error when the trainer_id is not set" do
  #   monster = Monster.new
  #   monster.valid?
  #   expect(monster.errors).to have_key(:trainer_id)
  # end

  it "can be created when a name, species, and trainer set" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "quincogdell@gmail.com"
    trainer.save

    monster = Monster.new
    monster.trainer = trainer
    monster.name = "Jon"
    monster.species = "Human"
    expect(monster.save).to be_true
    monster.valid?
  end

  it "will be destroyed when the owner is destroyed" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "quincogdell@gmail.com"
    trainer.save

    monster = Monster.new
    monster.trainer = trainer
    monster.name = "Jon"
    monster.species = "Human"
    monster.save
    trainer.destroy
    expect(Monster.exists?(monster.id)).to be false
  end


  # describe "initial conditions for a new monster" do
  #   let(:monster) do
  #     monster = Monster.new
  #   end

  #   it "cannot create a monster without a name" do
  #     expect(monster).to_not be_valid
  #   end

  #   it "cannot create a monster without a species" do
  #     expect(monster).to_not be_valid
  #   end

  #   it "has a health of 80" do
  #     expect(monster.health).to eq 80
  #   end

  #   it "has a energy of 80" do
  #     expect(monster.energy).to eq 80
  #   end

  #   it "cannot create a monstor without a name, species " do
  #     monster.name = "Quin"
  #     monster.species = "Human"
  #     expect(monster).to be_valid
  #   end
  # end

end
