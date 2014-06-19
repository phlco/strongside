require 'spec_helper'

describe Owner do
  context "when an owner is created" do
    it "has 100.00 in monies" do
      owner = Owner.new
    expect(owner.money).to eq(100.00)
    end

    it "has the candies" do
      owner = Owner.new
      expect(owner.candy).to eq(500)
    end
  end

  describe "takes_money method" do

    it "takes money from machine" do
      owner = Owner.new
      machine = Machine.new(money: 50)
      owner.takes_money(machine)
      expect(owner.money).to eq(150.00)
    end

  end

  describe "restock method" do

    let (:owner) do
      Owner.new
    end

    it "allows you to refill the machine up to 500" do
      machine = Machine.new(candy: 450, owner_id: owner.id, location: "hawaii")
      owner.restock(machine, 100)
      expect(machine.candy).to eq(500)
    end

    it "subtracts amount of candy from owner" do
      machine = Machine.new(candy: 450, owner_id: owner.id, location: "hawaii")
      owner.restock(machine, owner.candy)
      expect(owner.candy).to eq(450)
    end

  end

  describe "buy candy method" do

    it "increases owners candy by amount passed"

end
