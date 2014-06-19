require 'spec_helper'

describe Trainer do

  it "cannot create a trainer without a valid password, password confirmation, and email" do
    trainer = Trainer.new
    expect(trainer).to_not be_valid
  end


  it "cannot create a trainer without a valid email" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    expect(trainer).to_not be_valid
  end

  it "can create a trainer with valid password and password confirmation" do
    trainer = Trainer.new
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "vanderhoop@me.com"
    expect(trainer).to be_valid
  end


  it "will not let me create trainers with the same email" do
    trainer1 = Trainer.new
    trainer1.password = "kickhash"
    trainer1.password_confirmation = "kickhash"
    trainer1.email = "vanderhoop@me.com"
    trainer1.save

    trainer2 = Trainer.new
    trainer2.password = "password"
    trainer2.password_confirmation = "password"
    trainer2.email = "vanderhoop@me.com"
    expect(trainer2.save).to be_false
  end

  it "will ensure that my password is at least 6 characters" do
    trainer1 = Trainer.new
    trainer1.password = "marp"
    trainer1.password_confirmation = "marp"
    trainer1.email = "marp@darp.com"
    trainer1.save
    expect(trainer1).to_not be_valid
  end

end
