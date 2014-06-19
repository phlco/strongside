require 'spec_helper'

describe Trainer do
  context "prevent trainer creation against validations" do
    let(:trainer) do
      trainer = Trainer.new
    end
    it "cannot create a trainer without a valid password and password confirmation" do
      trainer.valid?
      expect(trainer.errors).to have_key(:password_digest)
    end

    it "cannot create a trainer without a valid email" do
      trainer.valid?
      expect(trainer.errors).to have_key(:email)
    end

    it "cannot create a trainer without a name" do
      trainer.valid?
      expect(trainer.errors).to have_key(:name)
    end

    it "cannot create a trainer if the password is less than 6 characters" do
      trainer.valid?
      expect(trainer.errors).to have_key(:password_digest)
    end

    it "cannot create a trainer if the email has already been recorded" do
      Trainer.create(email: "test@test.net", password: "testing", password_confirmation: "testing", name: "Guy")
      trainer.password = "kickhash"
      trainer.password_confirmation = "kickhash"
      trainer.email = "test@test.net"
      trainer.name = "Guy"
      expect(trainer.valid?).to be_false
    end
  end

  context "can create trainer with proper validation" do
    it "can create a trainer with a valid email, name, password and password confirmation" do
      trainer = Trainer.new
      trainer.password = "kickhash"
      trainer.password_confirmation = "kickhash"
      trainer.email = "test@test.net"
      trainer.name = "Guy"
      expect(trainer).to be_valid
    end
  end
end
