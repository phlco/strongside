require 'spec_helper'

describe Owner do
  let(:owner){
    Owner.create
  }

  let(:machine){
    Machine.create(
      money: 10.00,
      candy: 50,
      location: "1210 Western Avenue",
      owner_id: owner.id
    ) # Machine.create
  } # let :machine

  it { should have_many(:machines) }

  it "has a default candy count of 7000" do
    expect(owner.candy).to eq(7000)
  end

  it "has a default money of 1000" do
    expect(owner.money).to eq(1000)
  end

  describe "#buy_candy" do

    it "increase candy count" do
      expect{owner.buy_candy(1)}.to change{owner.candy}.by(1)
    end

    it "loses money when it buys candy" do
      expect{owner.buy_candy(1)}.to change{owner.money}.by(-0.01)
    end

  end # buy_candy

  describe "#add_candy" do

  end

  describe "#take_money" do
    it "adds money it to its bank account" do
      expect{owner.take_money(machine, 1.00)}.to change{owner.money}.by(1.00)
    end

    it "removes money from a machine" do
      expect{owner.take_money(machine, 2.00)}.to change{machine.money}.by(-2.00)
    end

  end #take_money

  describe "#restock_machine" do
    context "when the machine has less than 500 candies" do
      it "it fills the machine to 500" do
        owner.restock_machine(machine)
        expect(machine.candy).to eq(500)
      end
      it "removes candy from its candy stash" do
        expect{owner.restock_machine(machine)}.to change{owner.candy}.by(-450)
      end
    end #when the machine has < 500 candies
  end # describe #restock_machine

end # describe Owner
