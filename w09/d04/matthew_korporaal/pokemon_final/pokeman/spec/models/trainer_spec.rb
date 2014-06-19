require 'spec_helper'

describe Trainer do

  it "cannot create a trainer without a and password without password confirmation and without email" do
    trainer = Trainer.new
    expect(trainer).to_not be_valid
  end

  it "cannot create a trainer without a valid email" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    expect(trainer).to_not be_valid
  end

  it "can create a trainer with a valid password and password confirmation and email" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "kick@hash.com"
    expect(trainer).to be_valid

  end

  it "will not let me create trainers with the same email" do
    trainer1 = Trainer.new(password: "kickhash", password_confirmation: "kickhash", email: "kick@hash.com")
    trainer1.save
    trainer2 = Trainer.new(password: "kickhash", password_confirmation: "kickhash", email: "kick@hash.com")
    trainer2.email = "kick@hash.com"
    trainer2.password = "kickhash"
    trainer2.password_confirmation = "kickhash"
    expect(trainer2.save).to eq(false)
  end

  it "will ensure my password is at least 6 characters" do
    trainer2 = Trainer.new(password: "kick", password_confirmation: "kick", email: "kick@hash.com")
    expect(trainer2.save).to eq(false)
  end
end