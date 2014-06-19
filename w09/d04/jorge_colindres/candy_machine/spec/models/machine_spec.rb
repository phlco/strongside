require 'spec_helper'

describe Machine do

  let(:owner) { Owner.create }

  let(:machine) { Machine.new }

  it { should belong_to(:owner) }

  it { should validate_presence_of(:owner_id) }

  it { should validate_presence_of(:location) }

  context "when created" do
    it "has 0 candy" do
      expect(machine.candy).to eq(Machine::DEFAULT_CANDY)
    end

    it "has 0 money" do
      expect(machine.money).to eq(Machine::DEFAULT_MONEY)
    end

    it "has a candy price of 0.25" do
      expect(machine.price).to eq(Machine::DEFAULT_PRICE)
    end
  end

  describe "#sell_candy" do
    it "won't dispense below minimum amount" do
      machine.candy = Machine::MIN_CANDY
      machine.sell_candy
      expect(machine.candy).to eq(Machine::MIN_CANDY)
    end

    it "dispenses only 1 candy" do
      machine.candy = 50
      expect { machine.sell_candy }.to change { machine.candy }.by(-(Machine::DISPENSE_AMOUNT))
    end

    it "increases money by price of candy" do
      machine.candy = 50
      expect{ machine.sell_candy }.to change { machine.money }.by(machine.price)
    end
  end

  it "has a minimum of 0 candy" do
   machine.sell_candy
   expect(machine.candy).to eq(0)
  end

  it "has a maximum of 500 candy" do
    machine.candy = Machine::MAX_CANDY
    owner.restock(machine, 10)
    expect(machine.candy).to eq(Machine::MAX_CANDY)
  end

end
