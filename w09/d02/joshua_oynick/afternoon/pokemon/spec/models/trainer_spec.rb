require 'spec_helper'

describe Trainer do

  let(:trainer) { Trainer.new }

  # most manual and clunky
  it "is invalid without a password digest" do
    trainer.valid?
    expect(trainer.errors).to have_key(:password_digest) # rails errors manual checking
  end

  # relying on rspec helpers
  it "is invalid without a password digest v2" do
    expect(trainer).to have(1).error_on(:password_digest) # rspec helper
  end

  # cleanest, most readible and the most direct
  it { should validate_presence_of(:password_digest) } # shoulda-matchers
                                                       # https://github.com/thoughtbot/shoulda-matchers

  it { should validate_presence_of(:email) }

  it { should validate_uniqueness_of(:email) }

  it "can be created with a password, password_confirmation, and email set" do
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "kick@hash.com"
    expect(trainer.save).to be_true
  end

end




# describe Trainer do
#   it "can create a trainer with a valid password and password confirmation" do
#     trainer = Trainer.new()
#     trainer.valid?
#     expect(trainer.errors).to have_key(:password_digest)
#   end

#   it "does not have a password_digest error when a password and password_confirmation are set" do
#     trainer = Trainer.new()
#     trainer.password = "kickhash"
#     trainer.password_confirmation = "kickhash"
#     expect(trainer.errors).to_not have_key(:password_digest)
#   end

#   it "cannot create a trainer without a valid email" do
#     trainer = Trainer.new()
#     trainer.password = "kickhash"
#     trainer.password_confirmation = "kickhash"
#     expect(trainer).to_not be_valid
#   end


  # it "will not let me create trainers with the same email" do
  #   trainer1 = Trainer.new()
  #   trainer1.password = "kickhash"
  #   trainer1.password_confirmation = "kickhash"
  #   trainer1.email = "kick@hash.com"
  #   trainer1.save

  #   trainer2 = Trainer.new()
  #   trainer2.password = "password"
  #   trainer2.password_confirmation = "password"
  #   trainer2.email = "kick@hash.com"
  #   expect(trainer2.save).to be_false
  # end

  # it "will ensure my password is at least 6 characters" do
  #   trainer1 = Trainer.new()
  #   trainer1.password = "kick"
  #   trainer1.password_confirmation = "kick"
  #   trainer1.email = "kick@hash.com"
  #   binding.pry
  #   expect(trainer1.save).to be_false
  # end
