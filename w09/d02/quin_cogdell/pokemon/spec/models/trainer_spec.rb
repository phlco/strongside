require 'spec_helper'

describe Trainer do



  # clunky and manual - worst version
  it "has a password_digest error when password and password+confirmation are not set" do
    trainer = Trainer.new()
    trainer.valid?
    expect(trainer.errors).to have_key(:password_digest)
  end

  # relying on rpec helpers - better version
  it "in invalid without a password digest v2" do
    expect(trainer).to have(1).error_on(:password_digest)
  end

  # cleanest, most readible and the most direct
  # uses shoulda-matchers, https://github.com/thoughtbot/shoulda-matchers
  it { should validate_presence_of(:password_digest) }



  it "has a password_digest error when password and password+confirmation are not set" do
    trainer = Trainer.new()
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.valid?
    expect(trainer.errors).to_not have_key(:password_digest)
  end




  # it "cannot create a trainer without a valid email" do
  #   trainer = Trainer.new()
  #   trainer.password = "kickhash"
  #   trainer.password_confirmation = "kickhash"
  #   expect(trainer).to_not be_valid
  # end

  # it "cannot create a trainer without a valid password and password confirmation and email" do
  #   trainer = Trainer.new
  #   trainer.password = "kickhash"
  #   trainer.password_confirmation = "kickhash"
  #   trainer.email = "kick@hash.com"
  #   expect(trainer).to be_valid
  # end



  # it "will not let me create trainers with the same email" do
  #   trainer1 = Trainer.new
  #   trainer1.password = "kickhash"
  #   trainer1.password_confirmation = "kickhash"
  #   trainer1.email = "kick@hash.com"
  #   trainer1.save

  #   trainer2 = Trainer.new
  #   trainer2.password = "kickhash"
  #   trainer2.password_confirmation = "kickhash"
  #   trainer2.email = "kick@hash.com"
  #   expect(trainer2.save).to be_false

  # end

  # it "will ensure my password is at least 6 characters" do
  #   trainer1 = Trainer.new
  #   trainer1.password = "kick"
  #   trainer1.password_confirmation = "kick"
  #   trainer1.email = "kick@hash.com"
  #   expect(trainer1).to_not be_valid
  # end




end
