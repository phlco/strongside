# require 'spec_helper'

# describe Trainer do

#   it "has a password_digest error when password and password_confirmation are not set" do
#     trainer = Trainer.new
#     trainer.valid?
#     expect(trainer.errors).to have_key(:password_digest)
#   end

#   it "does not have a password_digest error when a password and password_confirmation are set" do
#     trainer = Trainer.new
#     trainer.password = "kickhash"
#     trainer.password_confirmation = "kickhash"
#     trainer.valid?
#     expect(trainer.errors).to_not have_key(:password_digest)
#   end

#   it "cannot create a trainer without a valid email" do
#     trainer = Trainer.new
#     trainer.valid?
#     expect(trainer.errors).to have_key(:email)
#   end

#   it "can create a trainer with a valid password and password confirmation and email" do
#     trainer = Trainer.new
#     trainer.password = "kickhash"
#     trainer.password_confirmation = "kickhash"
#     trainer.email = "kick@hash.com"
#     expect(trainer).to be_valid
#   end

#   it "will not let me create trainers with the same email" do
#     trainer1 = Trainer.new
#     trainer1.password = "kickhash"
#     trainer1.password_confirmation = "kickhash"
#     trainer1.email = "kick@hash.com"
#     trainer1.save

#     trainer2 = Trainer.new
#     trainer2.password = "password"
#     trainer2.password_confirmation = "password"
#     trainer2.email = "kick@hash.com"
#     expect(trainer2.save).to be_false
#   end

#   # it "will ensure my password is at least 6 charachters"
# end