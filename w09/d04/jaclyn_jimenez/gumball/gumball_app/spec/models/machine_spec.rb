require 'spec_helper'

describe Machine do

  let(:machine) {Machine.new}


  context "when newly created" do

    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:candy_price) }
    it { should validate_presence_of(:owner_id) }
    # it "should raise error without a location" do
    #   expect(machine).to have(1).errors_on(:location)
    # end
    # it "should not raise location error with a location" do
    #   machine.location = "902 broadway"
    #   expect(machine).to have(0).errors_on(:location)
    # end

    it "should start with no money" do
      expect(machine.money).to eq(0.00)
    end
    it "should start with no candy" do
      expect(machine.candy).to eq(0)
    end
    it { should validate_presence_of(:candy_price)}
  end


  context "when properly created machine" do
    before(:each) do
      owner = Owner.create
      machine = Machine.new({location: "902 broadway", candy_price: 0.25})
      machine.owner = owner
      machine.save
    end
    describe "#refill" do
      it "should be able to refill candy" do
        machine.refill(100)
        expect(machine.candy).to eq(100)
      end
      it "can't put in more than 500" do
        machine.refill(600)
        expect(machine.candy).to eq(500)
      end

    end
  end
  context "when selling candy" do
    before(:each) do
      @owner = Owner.create
      @machine = Machine.new({location: "902 broadway", candy_price: 0.25})
      @machine.owner = @owner
      @machine.save
      @machine.refill(20)
    end
    describe "#sell_candy" do
      it "should remove number of candy from machine" do
        expect{@machine.sell_candy(1)}.to change{@machine.candy}.by(-1)
      end
      it "should add money eq to candy amount" do
        # machine.sell_candy(10)
        # expect(machine.money).to eq(2.5)
        amount = 10
        expect{@machine.sell_candy(amount)}.to change{@machine.money}.by(@machine.candy_price * amount)
      end
    end
  end
end
