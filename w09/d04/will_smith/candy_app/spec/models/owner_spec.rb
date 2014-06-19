require 'spec_helper'

describe Owner do
  before(:each) do
    @owner = Owner.create(name: "Will")

    @machine = Machine.create(
      owner_id: @owner.id,
      location: "NYC"
      )
  end

  #shoulda gem to validate proper table set up
  it { should have_db_column(:candy).of_type(:integer)}

  it { should have_db_column(:money).of_type(:float)}

  it {should have_db_column(:name).of_type(:string)}

  it { should validate_presence_of :name }

  it { should have_many :machines }

  context 'when newly created' do
    it "has no money" do
      expect(@owner.money).to eq(0)
    end

    it "has no candy" do
      expect(@owner.candy).to eq(0)
    end
  end

  describe '#take_money' do
    it "removes all money from the machine" do
      @machine.money = 100
      @owner.take_money(@machine)
      expect(@machine.money).to eq(0)
    end

    it "adds all machine money to owner money" do
      @machine.money = 100
      expect{ @owner.take_money(@machine) }.to change { @owner.money }.by(100)
    end
  end

  describe '#fill' do
    context 'affects machine candy total by' do
      it "accepting candy" do
        @owner.fill(@machine, 100)
        expect(@machine.candy).to be(100)
      end

      it "increasing candy total by the amount of candy added" do
        @machine.candy = 0
        expect{@owner.fill(@machine, 100)}.to change { @machine.candy }.by(100)
      end

      it "limiting the amount of total candy" do
        @machine.candy = 450
        @owner.fill(@machine, 100)
        expect(@machine.candy).to be(500)
      end

      it "accepting candy as a numerical input" do
        @machine.candy = 100
        @owner.fill(@machine, "500 gumballs")
        expect(@machine.candy).to be(100)
      end
    end
  end

  describe '#buy_candy' do
    context 'affects money by ' do
      it 'decreasing total money by .01 per piece of candy' do
        @owner.money = 10
        @owner.buy_candy(100)
        expect(@owner.money).to eq(9)
      end
    end
    context 'affects candy by' do
      it 'increases the total candy by the amount of candy bought' do
        @owner.candy = 0
        @owner.buy_candy(100)
        expect(@owner.candy).to eq(100)
      end
    end
  end
end
