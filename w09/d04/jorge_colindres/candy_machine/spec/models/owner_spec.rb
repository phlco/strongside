require 'spec_helper'
require 'bigdecimal'

describe Owner do

  let(:machine) { Machine.create }
  let(:owner) { Owner.new }

  describe "#remove_money" do
    it "it takes money in machine and adds it to own money" do
      machine.money = 20.00
      owner.money = 10.00
      owner.remove_money(machine)
      expect(owner.money).to eq(30.00)
    end

    it "empties all money in machine" do
      machine.money = 20.00
      owner.remove_money(machine)
      expect(machine.money).to eq(0.00)
    end
  end

  describe "#restock" do
    it "restocks machine with candy" do
      machine.candy = 10
      owner.restock(machine, 10)
      expect(machine.candy).to eq(20)
    end

    it "cannot restock machine with more candy than max amount" do
      machine.candy = 480
      owner.restock(machine, 30)
      expect(machine.candy).to eq(Machine::MAX_CANDY)
    end

    it "returns false if trying to restock machine with more candy than it has" do
      owner.candy = 100
      expect(owner.restock(machine, 200)).to be_false
    end
  end

  describe "#buy_candy" do
    it "increases candy level by candy_amount" do
      owner.money = 100.0
      owner.candy = 0
      owner.buy_candy(50)
      expect(owner.candy).to eq(50)
    end

    it "decreases money by .01 per candy_amount" do
      owner.money = 100.0
      owner.buy_candy(50)
      expect(owner.money).to eq(BigDecimal.new("99.5"))
    end

    it "doesn't increase candy if it doesn't have enough money" do
      owner.buy_candy(1)
      expect(owner.candy).to eq(Owner::DEFAULT_CANDY)
    end

    it "returns false if doesn't have enough money for candy" do
      expect(owner.buy_candy(1)).to be_false
    end
  end

end
