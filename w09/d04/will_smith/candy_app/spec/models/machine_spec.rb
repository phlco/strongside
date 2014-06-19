require 'spec_helper'

describe Machine do
  let (:machine) { Machine.new }
  let(:owner) { Owner.new(name: "Will") }

  #shoulda gem to validate proper table set up
  it {should have_db_column(:candy).of_type(:integer)}

  it {should have_db_column(:location).of_type(:string)}

  it {should have_db_column(:money).of_type(:float)}

  it {should have_db_column(:owner_id).of_type(:integer)}

  it {should have_db_column(:price).of_type(:float)}

  it {should belong_to(:owner)}

  # using rspec matchers
  it "is invalid without an owner_id" do
    expect(machine).to have(1).error_on(:owner_id)
  end

  it "is invalid without a location" do
    expect(machine).to have(1).error_on(:location)
  end

  context "when newly created" do
    let(:machine) do
      machine = Machine.new
      machine.location = "NYC"
      machine.owner_id = 1
      machine
    end
  end

    it "set the candy price to 0.25" do
      expect(machine.price).to eq(0.25);
    end

    it "set the money to 0" do
      expect(machine.money).to eq(0);
    end

  describe '#sell' do
    context 'affects money by ' do
      it 'adding 0.25 for every piece of candy bought' do
        machine.money = 0
        machine.sell(1)
        machine.money.should be_close(0.25, 0.1)
      end
    end
    context 'affects candy by' do
      it 'decreasing the amount of total candy' do
        machine.candy = 500
        machine.sell(1)
        expect(machine.candy).to be(499)
      end

      it 'alerting customers when there is no more candy' do
        machine.candy = 0
        machine.sell(1)
        expect("Temporarily out of candy!").to be
      end
    end
  end
end
