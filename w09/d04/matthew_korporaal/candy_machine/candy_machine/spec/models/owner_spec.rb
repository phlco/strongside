require 'spec_helper'

describe Owner do
  let(:owner) { Owner.new }

  context ".new" do
    it { should validate_presence_of(:candy) }
    it { should validate_presence_of(:money) }
  end

  describe "#buy_candy" do
    it "should pay .01 for 1 piece of candy" do
      expect { owner.buy_candy(100) }.to change { owner.money }.by(-1)
    end
    it "should have more candy after buying candy" do
      expect { owner.buy_candy(100) }.to change { owner.candy }.by(100)
    end
  end

  describe "#take_money" do
    before(:each) do
      @machine = Machine.new
      @machine.owner_id = owner.id
      @machine.location = "the bronx"
      @machine.price = 0.25
      @machine.money = 4
    end
    it "should remove money from a machine" do
      expect { owner.take_money(@machine) }.to change { @machine.money}.by(-4)
    end
    it "should add money to itself" do
      expect { owner.take_money(@machine) }.to change { owner.money }.by(4)
    end
  end
end
