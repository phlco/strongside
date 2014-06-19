require 'spec_helper'

describe Trainer do

  it "cannoted create a trainer without a password and password_confirmation and email" do
    trainer = Trainer.new
    expect(trainer).to_not be_valid
  end

  it "cannot create a trainer without a valid email" do
    trainer = Trainer.new
    trainer.password = '32323232'
    trainer.password_confirmation = '32323232'
    expect(trainer).to_not be_valid
  end

  it "can create a trainer with a valid password and password confirmation" do
    trainer = Trainer.new
    trainer.email = "coopermayne@gmail.com"
    expect(trainer).to_not be_valid
  end

  it "will not let me create trainers with the same email" do
    trainer1 = Trainer.new
    trainer1.email = "cooper@gmail.com"
    trainer1.password = "32323232"
    trainer1.password_confirmation = "32323232"
    trainer1.save

    trainer2 = Trainer.new
    trainer2.email = "cooper@gmail.com"
    trainer2.password = "32323232"
    trainer2.password_confirmation = "32323232"

    expect(trainer2).to_not be_valid
  end

  xit "will ensure my password is at least 6 charachters" do
    trainer = Trainer.new
    trainer.email = "cooper@gmail.com"
    trainer.password = "3232"
    trainer.password_confirmation = "3232"
    expect(trainer).to_not be_valid
  end

  it "should have a valid email address" do
    trainer = Trainer.new
    trainer.email = "cooper"
    trainer.password = "32323232"
    trainer.password_confirmation = "32323232"
    expect(trainer).to_not be_valid
  end

  it "should have a valid email address" do
    trainer = Trainer.new
    trainer.email = "@com.com"
    trainer.password = "32323232"
    trainer.password_confirmation = "32323232"
    expect(trainer).to_not be_valid
  end

  it "should have a valid email address" do
    trainer = Trainer.new
    trainer.email = "com.com"
    trainer.password = "32323232"
    trainer.password_confirmation = "32323232"
    expect(trainer).to_not be_valid
  end

  it "should have a valid email address" do
    trainer = Trainer.new
    trainer.email = "a@com"
    trainer.password = "32323232"
    trainer.password_confirmation = "32323232"
    expect(trainer).to_not be_valid
  end
end
