require 'spec_helper'

describe Machine do
  let!(:machine) do
    Machine.new(:location => "1210 Western Avenue")
  end

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
    context "when machine has 1 or more candies" do
      before(:each) do
        machine[:candy] = 500
      end

      it "dispenses 1 piece of candy" do
        machine.sell_candy
        expect(machine.candy).to eq(499)
      end

      it "takes in money equal to its candy price" do
        machine.sell_candy
        expect(machine.money).to eq(0.25)
      end
    end # when machine has 1 or more candies

    context "when machine has no candy" do

      it "won't give out any candy" do
        expect{machine.sell_candy}.to_not change{machine.candy}.by(-1)
      end

      it "it won't add money to its coffers" do
        expect{machine.sell_candy}.to_not change{machine.money}.by(0.25)
      end
    end # when machine has no candy

  end # describe #sell_candy

end # describe Machine
