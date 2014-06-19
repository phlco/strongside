require 'spec_helper'

describe Owner do
  context "when newly created" do
    it { should validate_presence_of(:money) }
  end

  context "when taking money" do
    before(:each) do
      @owner = Owner.create({money: 0.00})
      @machine = Machine.new({location: "902 broadway", candy_price: 0.25})
      @machine.owner = @owner
      @machine.save
    end
    describe "#take_money" do
      it "should take money from machine and give to owner" do
        expect{@owner.take_money(@machine)}.to change{@owner.money}.by(@machine.money)
      end
      it "should reduce machine's money" do
        expect{@owner.take_money(@machine)}.to change{@machine.money}.by(@machine.money)
      end
    end
    describe "#restock" do
      it "should restock machine" do
        amount = 100
        expect{@owner.restock(@machine, amount)}.to change{@machine.candy}.by(amount)
      end
    end
  end
end
