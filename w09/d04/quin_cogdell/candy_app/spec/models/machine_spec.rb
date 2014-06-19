require 'spec_helper'

describe Machine do

  let(:machine) { Machine.new }
  let(:owner) { Owner.new(name: "Quin") }

  # using shoulda
  it { should validate_presence_of(:location) }

  # using rspec matchers
  it "is invalid without an owner_id" do
    expect(machine).to have(1).error_on(:owner_id)
  end

  # shoulda
  it { should belong_to :owner }

  context "when newly created" do
    let(:machine) do
      machine = Machine.new
      machine.location = "NYC"
      machine.owner_id = 1
      machine
    end

    it "has a candy price of 0.25 when created if no candy price is specified" do
      expect(machine.candy_price).to eq(0.25);
    end

    it "is empty when created if no candy amount is specified" do
      expect(machine.empty?).to be_true;
    end

    it "has no money when created if no money amount is specified" do
      expect(machine.money).to eq(0);
    end

    it "does not increase money when the machine has no candy" do
      expect{ machine.sell }.to change { machine.money }.by 0
    end

    it "has a capacity equal to the maximum candy" do
      expect( machine.capacity ).to eq( Machine::MAX_CANDY)
    end

  end



  describe "#fill" do
    let(:machine) do
      machine = Machine.new
      machine.location = "NYC"
      machine.owner_id = 1
      machine
    end

    it "accepts candy" do
      machine.fill(100)
      expect(machine.candy).to be(100)
    end

    it "increase candy by the amount added" do
      expect{machine.fill(100)}.to change { machine.candy }.by(100)
    end

    it "is full when candy equals max candy" do
      machine.fill(Machine::MAX_CANDY)
      expect(machine.full?).to be_true
    end

    it "does not accept candy over the max candy limit" do
      expect { machine.fill(600)}.to change { machine.candy }.by 500
    end

  end

  describe "#sell" do

    context "when the machine has candy and is in service" do

      let(:machine) do
        machine = Machine.new
        machine.location = "NYC"
        machine.owner_id = 1
        machine.fill(10)
        machine
      end

      it "dispenses 1 candy at a time" do
        expect { machine.sell }.to change { machine.candy }.by(-1)
      end

      it "increases money by they candy price" do
        expect { machine.sell }.to change { machine.money }.by(machine.candy_price)
      end



      it "does not increase money when the machine has no candy" do
        candy_count = machine.candy
        candy_count.times { machine.sell }

      end

    end







  end



end
