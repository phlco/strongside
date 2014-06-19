require 'spec_helper'

describe Trainer do
# first tests that you CAN'T make a trainer without a password & confirmation
  it "cannot create a trainer without a valid password and password confirmation" do
    trainer = Trainer.new()
    expect(trainer).to_not be_valid
  end

# tests that a trainer CAN'T be created without an email
  it "cannot create a trainer without a valid email and password" do
    trainer = Trainer.new()
    trainer.password = 'kickhash'
    trainer.password_digest = 'kickhash'
    trainer.name = "foo"
    expect(trainer).to_not be_valid
  end

# can create a valid user with an email, password, and password digest
  it "can create a trainer with a valid password and password confirmation" do
    trainer = Trainer.new()
    trainer.password = 'kickhash'
    trainer.password_confirmation = 'kickhash'
    trainer.email = "kickhash@kickhash.com"
    trainer.name = "foo"
    expect(trainer).to be_valid
  end

  it "will have a unique email" do
    trainer1 = Trainer.new()
    trainer1.password = 'kickhash'
    trainer1.password_confirmation = 'kickhash'
    trainer1.email = "kickhash@kickhash.com"
    trainer1.name = "foo"
    trainer1.save
    trainer2 = Trainer.new()
    trainer2.password = 'kickhash'
    trainer2.password_confirmation = 'kickhash'
    trainer2.email = "kickhash@kickhash.com"
    trainer2.name = "bar"
    expect(trainer2.save).to be_false
  end

  it "will block passwords that are less than 6 charasters" do
    trainer = Trainer.new()
    trainer.password = 'kick'
    trainer.password_confirmation = 'kick'
    trainer.email = "kickhash@kickhash.com"
    trainer.name = "foo"
    expect(trainer).to_not be_valid
  end

  it "requires a password of at least 6 charasters" do
    trainer = Trainer.new()
    trainer.password = 'kickhash'
    trainer.password_confirmation = 'kickhash'
    trainer.name = "foo"
    trainer.email = "kickhash@kickhash.com"
    expect(trainer).to be_valid
  end
end
