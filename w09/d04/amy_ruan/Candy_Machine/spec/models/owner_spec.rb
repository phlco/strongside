require 'spec_helper'

describe Owner do
  let(:owner){
    Owner.create(
    )
  }

  let(:machine){
    Machine.create(
      money: 10.00,
      candy: 400,
      location: "1210 Western Avenue",
      owner_id: owner.id
    )
  }

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

  describe "#restock_candy" do
    it "adds candies in the machine" do
      expect{owner.restock_candy(machine, 100)}.to change{machine.candy}.by(100)
    end

    it "removes candy from the owner" do
      expect{owner.restock_candy(machine, 100)}.to change{owner.candy}.by(-100)
    end

    it "does not add anymore if the machine has 500" do
      expect{owner.restock_candy(machine, 200)}.to change{machine.candy}.by(100)
    end

    it "does not add more than what the owner has" do
      owner.candy = 50
      expect{owner.restock_candy(machine, 200)}.to change{machine.candy}.by(50)
    end
  end

  describe "#take_money" do
    it "adds money it to its bank account" do
      expect{owner.take_money(machine, 1.00)}.to change{owner.money}.by(1.00)
    end

    it "removes money from a machine" do
      expect{owner.take_money(machine, 2.00)}.to change{machine.money}.by(-2.00)
    end
  end #take_money

end # describe Owner
