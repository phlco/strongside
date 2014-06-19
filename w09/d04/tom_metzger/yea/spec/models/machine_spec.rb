require 'spec_helper'

describe Machine do
  let(:machine) {Machine.new(location: "123 abc df")}

  describe "initial validation" do
    it {should validate_presence_of(:candy)}
    it {should validate_presence_of(:candy_price)}
    it {should validate_presence_of(:location)}
    it {should validate_presence_of(:money)}
    it {should validate_presence_of(:owner_id)}

    it "can save" do
      machine.owner_id = 1
      expect(machine.save).to be_true
    end
  end

  context "when created" do

    it "has 0 candy pieces" do
      expect(machine.candy).to be(0)
    end

    it "has a candy price of $0.25" do
      expect(machine.candy_price).to eq(0.25)
    end

    it "has 0 money" do
      expect(machine.money).to eq(0)
    end
  end

  describe "#fill" do

    it "adds candy to machine" do
      machine.fill(20)
      expect(machine.candy).to eq(20)
    end

    context "when adding too many gumballs" do
      it "can't have more than 500 gumballs" do
        machine.fill(2000)
        expect(machine.candy).to eq(500)
      end

      it "returns remainder when overfilling" do
        expect(machine.fill(2000)).to eq(1500)
      end
    end
  end

  describe "#sell_candy" do
    it "increases money amount" do
      expect{machine.sell_candy}.to change{machine.money}.by(machine.candy_price)
    end

    context "when there are enough gumballs" do
      it "reduces candy amount" do
        machine.candy = 20
        expect{machine.sell_candy}.to change{machine.candy}.by(-1)
      end
    end

    context "when there aren't enough gumballs" do
      it "returns false" do
        expect(machine.sell_candy).to be_false
      end
    end
  end

end
