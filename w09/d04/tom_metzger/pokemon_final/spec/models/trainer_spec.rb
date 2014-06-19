require 'spec_helper'

describe Trainer do

  let(:trainer) { Trainer.new }

  # most manual and clunky
  it "is invalid without a password digest" do
    trainer.valid?
    expect(trainer.errors).to have_key(:password_digest) # rails errors manual checking
  end

  # relying on rspec helpers
  it "is invalid without a password idgest v2" do
    expect(trainer).to have(1).error_on(:password_digest) # rspec helper
  end

  # cleanest, most readible and the most direct
  it { should validate_presence_of(:password_digest) }
  # shoulda-matchers
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
