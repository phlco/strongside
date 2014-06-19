require 'spec_helper'

describe Trainer do
  it "cannot create a trainer without a valid email, password & confirmation" do
    trainer = Trainer.new()
    expect(trainer).to_not be_valid
  end
  it "cannot create a trainer without a valid email" do
    trainer = Trainer.create({password: "kickhash", password_confirmation: "kickhash"})
    expect(trainer).to_not be_valid
  end
  it "can create a trainer with a valid password and confirmation" do
    trainer = Trainer.create(
      {
        name: "jackie",
        email: "jaclynejimenez@gmail.com",
        password: "kickhash",
        password_confirmation: "kickhash"
      }
    )
    expect(trainer).to be_valid
  end

  it "will not let me create trainers with the same email" do
    trainer1 = Trainer.create(
      {
        name: "jackie",
        email: "jaclynejimenez@gmail.com",
        password: "kickhash",
        password_confirmation: "kickhash"
      }
    )
    trainer2 = Trainer.new(
      {
        name: "jackie",
        email: "jaclynejimenez@gmail.com",
        password: "kickhash123",
        password_confirmation: "kickhash123"
      }
    )
    expect(trainer2.save).to be_false
  end
  it "will ensure my password is at least 6 characters" do
    trainer3 = Trainer.new(
      {
        name: "jackie",
        email: "kick@hash.com",
        password: "123",
        password_confirmation: "123"
      }
    )
    expect(trainer3.save).to be_false
  end
  it "will not save unless it is passed a name" do
    trainer3 = Trainer.new(
      {
        email: "kick@hash.com",
        password: "123456789",
        password_confirmation: "123456789"
      }
    )
    expect(trainer3.save).to be_false
  end
end
