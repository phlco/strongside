require 'spec_helper'

describe Machine do
  let(:machine) {Machine.new}
  let(:owner) {Owner.new}

  context "when newly created" do

    it { should validate_presence_of(:location) }

    # it "should raise error without a location" do
    #   expect(machine).to have(1).errors_on(:location)
    # end
    # it "should not raise location error with a location" do
    #   machine.location = "902 broadway"
    #   expect(machine).to have(0).errors_on(:location)
    # end
    it "should be initialized with an owner" do
      owner.save
      machine.owner_id = owner.id
      expect(machine).to have(0).errors_on(:owner_id)
    end
    it "should start with no money" do
      expect(machine.money).to eq(0.00)
    end
    it "should start with no candy" do
      expect(machine.candy).to eq(0)
    end
    it { should validate_presence_of(:candy_price)}
  end

  describe "#refill" do
    context "when properly created machine" do
      before(:each) do
        owner = Owner.create
        Machine.new({location: "902 broadway", candy_price: 0.25})
        machine.owner = owner
        machine.save
      end
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

  describe '#sell' do
    before(:each) do
      owner = Owner.create
      Machine.new({location: "902 broadway", candy_price: 0.25})
      machine.owner = owner
      machine.save
    end

    context "when it has candy" do

      it "dispenses one piece of candy" do

        machine.refill(500)
        expect { machine.sell }.to change { machine.candy }.by(-1)

      end

      it "increases money within by price of candy" do

        machine.refill(500)
        expect { machine.sell }.to change { machine.money }.by( machine.candy_price )

      end

    end

    context "when it doesn't have candy" do

      it "does not dispense candy or gain money" do

        expect { machine.sell }.to change { machine.money }.by(0)

        expect { machine.sell }.to change { machine.candy }.by(0)

      end

    end


  end


  # end
end
