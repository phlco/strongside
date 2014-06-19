require 'spec_helper'

# removes money from the machine
# Restock (takes as an arg the machine as well as the number of candy)

# takes the input for the number of candies to put in
# but only up until 500
# say
# you try to restock a candy machine that has 450 candy in it
# restock(100)
# this will only fill it up by 50
# Buy Candy (takes in the number of candy they want to buy)

# it costs .01 per 1 pieces of candy
# removes .01 per 1 pieces of candy purchased
# increases the level of candy by 1

describe Owner do
  let(:owner) { Owner.new }

  it { should validate_presence_of :name }


  context 'newly created' do

    it "has no money" do
      binding.pry
      expect( owner.money? ).to be_false
    end

    it "has no candy" do
      expect(owner.candy?).to be_false
    end
  end

  describe '#restock' do

    let(:owner) { Owner.create(name: 'Quin') }
    # let(:machine) { Machine.create(location: 'NYC', owner: owner) }
    let(:machine) { Machine.new(location: 'NYC') }


    # let(:machine) do
    #   Machine.new
    #   machine.location = 'NYC'
    #   machine.owner = owner
    #   machine.save
    #   machine
    # end


    it "fills a given machine with candy" do
      machine.owner = owner
      machine.save
      # binding.pry

      expect { owner.restock(machine, 100) }.to change { machine.candy }.by 100
    end

  end


end
