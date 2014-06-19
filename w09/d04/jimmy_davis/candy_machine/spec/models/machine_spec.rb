require 'spec_helper'

describe Machine do

  let(:owner) do
    Owner.create
  end

  let(:machine) { Machine.new }

  it { should belong_to(:owner) }

  it { should validate_presence_of(:owner_id) }

  it { should validate_presence_of(:location) }

  context "when created" do

    it "has 0 candy when created" do
      expect(machine.candy).to eq(Machine::DEFAULT_CANDY)
    end

    it "has 0 money when created" do
      expect(machine.money).to eq(Machine::DEFAULT_MONEY)
    end

    it "has a candy price of 0.25" do
      expect(machine.price).to eq(Machine::DEFAULT_PRICE)
    end
  end

  describe "#sell_candy" do

    it "should dispense only 1 candy" do
      machine.candy = 50
      expect { machine.sell_candy }.to change { machine.candy }.by(-(Machine::DISPENSE_AMOUNT))
    end

    it "increase money by price" do
      machine.candy = 50
      expect{ machine.sell_candy }.to change { machine.money }.by(machine.price)
    end

    it "has a minimum of 0 candy" do
     machine.sell_candy
     expect(machine.candy).to eq(0)
    end

  end


  # it "has a maximum of 500 candy" do
  #   machine.candy = 550
  #   expect(machine.candy).to eq(500)
  # end

end
