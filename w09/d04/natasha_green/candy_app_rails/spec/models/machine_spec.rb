require 'spec_helper'

describe Machine do

  let(:machine) { Machine.new }
  let(:owner) { Owner.new(name: "Quin") }

  # using should
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

    it "has no money when created if no money amount is specified" do
      expect(machine.money).to eq(0);
    end

    it "accepts candy" do
      machine.fill(100)
      expect(machine.candy).to be(100)
    end

    it "increase candy by the amount added" do
      machine.candy = 0
      expect{machine.fill(100)}.to change { machine.candy }.by(100)
    end


  end

  # describe "#sell" do

  #   let(:machine) do
  #     machine.owner = owner
  #   end

  #   context


  # end



end
