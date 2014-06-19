# == Schema Information
#
# Table name: owners
#
#  id         :integer          not null, primary key
#  money      :decimal(, )
#  candy      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Owner do
  let (:owner) { Owner.create()}
  let (:machine) {owner.machines.create({money: BigDecimal("5.00")})}
  context "iniitialized" do
    it "starts out with no money" do
      expect(owner.money).to eq(BigDecimal("0.00"))
    end
    it "starts out with no candy" do
      expect(owner.candy).to eq(BigDecimal("0.00"))
    end
  end
  describe "take_money method" do
    it "takes money from the machine" do
      owner.take_money(machine)
      expect(machine.money).to eq(BigDecimal("0.00"))
    end
    it "adds the money to the owner" do
      money = machine.money
      owner.take_money(machine)
      expect(owner.money).to eq(money)
    end
  end
  describe "restock method" do
    before(:each) do
      owner.candy = 300
    end
    it "adds candy to the machine" do
      machine.candy = 0
      owner.restock(machine, 200)
      expect(machine.candy).to eq(200)
    end
    it "removes candy from owner" do
      machine.candy = 0
      owner.restock(machine, 200)
      expect(owner.candy).to eq(100)
    end
    it "can only take as much candy as the owner has" do
      machine.candy = 0
      owner.restock(machine, 400)
      expect(machine.candy).to eq(300)
    end
    it "can only add as much as machine can hold" do
      machine.candy = 300
      owner.restock(machine, 300)
      expect(machine.candy).to eq(500)
    end
  end
  describe "buy_candy method" do
    before(:each) do
      owner.money = BigDecimal("5.00")
    end
    it "removes .01 per 1 piece of candy bought" do
      owner.buy_candy(100)
      expect(owner.money).to eq(BigDecimal("4.00"))
    end
    it "increases the number of candy by the inputed amount" do
      owner.buy_candy(100)
      expect(owner.candy).to eq(100)
    end

  end
end
