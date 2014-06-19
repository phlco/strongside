require 'spec_helper'

describe Trainer do

  it "cannot create a trainer without a and password without password confirmation and without email" do
    trainer = Trainer.new

    #old way
    #expect(trainer).to_not be_valid

    #new way
    #when you create a new trainer and call valid, it gives you the exact errors
    trainer.valid?
    expect(trainer.errors).to have_key(:password_digest)
    expect(trainer.errors).to have_key(:email)
  end

  it "cannot create a trainer without a valid email" do
    trainer = Trainer.new
    trainer.name = "Alex"
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    expect(trainer).to_not be_valid
  end

  it "can create a trainer with a valid password and password confirmation and email" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "kick@hash.com"
    trainer.name = "Alex"
    expect(trainer).to be_valid
  end

  it "will not let me create trainers with the same email" do
    #binding.pry
    trainer1 = Trainer.new
    trainer1.password = "kickhash"
    trainer1.password_confirmation = "kickhash"
    trainer1.email = "kick@hash.com"
    trainer1.name = "Alex"
    trainer1.save

    trainer2 = Trainer.new
    trainer2.password = "password"
    trainer2.password_confirmation = "password"
    trainer2.email = "kick@hash.com"
    trainer2.name = "Alex"
    trainer2.save
    expect(trainer2.save).to be_false
  end

  it "will save trainer if password is at least 6 charachters" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "kick@hash.com"
    trainer.name = "Alex"
    expect(trainer.save).to be_true
  end

  it "will not save trainer if password is less than 6 charachters" do
    trainer = Trainer.new
    trainer.password = "kick"
    trainer.password_confirmation = "kick"
    trainer.email = "kick@hash.com"
    trainer.name = "Alex"
    expect(trainer.save).to be_false
  end

  it "will not save the trainer without the name" do
    trainer = Trainer.new
    trainer.password = "kick"
    trainer.password_confirmation = "kick"
    trainer.email = "kick@hash.com"
    expect(trainer.save).to be_false
  end

end







