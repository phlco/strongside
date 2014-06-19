require 'spec_helper'

describe Machine do

  let(:machine){Machine.new}

  context "when machine is created" do

    it "has 0 candies" do
      expect(machine.candy).to eq(0)
    end

    it "has 0.00 monies" do
      expect(machine.money).to eq(0.00)
    end

    it "is invalid without location" do
      machine.valid?
      expect(machine.errors).to have_key(:location)
    end

    it "is invalid without an owner_id" do
      expect(machine).to have(1).error_on(:owner_id)
    end


    it "has a set candy price" do
      expect(machine.candy_price).to eq(0.50)
    end
  end

  describe "sell method" do

    let(:machine) do
      machine = Machine.new
      machine.candy = 4
      machine.sell

      machine
    end

    it "dispences 1 candy" do
      expect(machine.candy).to eq(3)
    end

    it "takes money equal to 1 candy price" do
      expect(machine.money).to eq(0.50)
    end

  end

end
