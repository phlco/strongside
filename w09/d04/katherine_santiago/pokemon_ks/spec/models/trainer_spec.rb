require 'spec_helper'

describe Trainer do

  let(:trainer) { Trainer.new }

  it "is invalid without a password digest" do
    trainer.valid?
    expect(trainer.errors).to have_key(:password_digest)
  end

  it "is invalid without a password digest v2" do
    expect(trainer).to have(1).error_on(:password_digest)
  end

  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  it "can be created with a password, password_conf and email set" do
    trainer.password = "kickhash"
    trainer.password_confirmation = "kickhash"
    trainer.email = "kick@hash.com"
    expect(trainer.save).to be_true
  end

end