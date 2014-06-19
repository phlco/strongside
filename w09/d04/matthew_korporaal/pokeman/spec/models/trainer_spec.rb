require 'spec_helper'

describe Trainer do

  let(:trainer) { Trainer.new }

  it "cannot create a trainer without a and password without password confirmation and without email" do
    expect(trainer).to_not be_valid
  end

  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  it "can create a trainer with a valid password and password confirmation and email" do
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
    trainer.password = "kick"
    trainer.password_confirmation = "kick"
    trainer.email = "kick@hash.com"
    expect(trainer.save).to eq(false)
  end
end