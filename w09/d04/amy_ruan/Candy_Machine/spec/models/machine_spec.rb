require 'spec_helper'

describe Machine do


  let(:machine){
    Machine.create(
      location: "301 Broadway"

      )
  }

  it {should belong_to(:owner)}

  it "has a default candy count of 0" do
    expect(machine.candy).to eq(0)
  end

  it "has a default money count of 0.00" do
    expect(machine.money).to eq(0.00)
  end

  it {should validate_presence_of(:location)}

  it "has a default candy price of 0.25" do
    expect(machine.candy_price).to eq(0.25)
  end

  describe "#sell_candy" do
    it "increases money in the machine by candy price" do
      machine.candy = 100
      expect{machine.sell_candy(12)}.to change{machine.money}.by(3.0)
    end
    it "decreases the amount of candy in the machine" do
      machine.candy = 100
      expect{machine.sell_candy(12)}.to change{machine.candy}.by(-12)
    end
    it "prevents you from selling more than machine has" do
      machine.candy = 100
      expect{machine.sell_candy(120)}.to change{machine.candy}.by(-100)
    end
  end

end
