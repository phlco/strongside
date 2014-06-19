require 'spec_helper'

describe Owner do

  let(:owner) {Owner.new}
  let(:machine) {Machine.new}


  context "when newly created" do

    it { should validate_presence_of(:money) }
    it { should validate_presence_of(:candy) }

  end

  describe '#take money' do
    before(:each) do
      owner = Owner.create({money: 0, candy: 0})
      Machine.new({location: "902 broadway", candy_price: 0.25})
      machine.owner = owner
      machine.save
    end

    it "decreases money in the machine" do
      machine.money = 20
      expect { owner.take_money( machine, 10 ) }.to change { machine.money }.by(-10)
    end

    it "increases owner's money by amount specified" do

      machine.money = 20
      expect { owner.take_money( machine, 10 ) }.to change { owner.money }.by(10)

    end

    it "cannot overdraw" do

      machine.money = 20
      owner.take_money( machine, 30 )
      expect( machine.money ).to eq(0)
      expect( owner.money ).to eq(20)

    end


  end

  describe "#restock" do

    before(:each) do
      owner = Owner.create({money: 0, candy: 0})
      Machine.new({location: "902 broadway", candy_price: 0.25})
      machine.owner = owner
      machine.save
    end

    it "adds candy to machine" do

      owner.candy = 500
      expect { owner.restock( machine, 500 ) }.to change { machine.candy }.by(500)

    end

    it "adds candy only up to 500" do

      owner.candy = 1000
      expect { owner.restock( machine, 600 )}.to change { machine.candy }.by(500)

    end

    it "reduces owner candy by amount" do

      owner.candy = 1000
      expect { owner.restock( machine, 500 ) }.to change { owner.candy }.by(-500)

    end

    it "stocks no more candy than the owner has" do

      expect { owner.restock( machine, 500 ) }.to change { machine.candy }.by(0)

    end
  end

  describe  "#buy_candy" do

    before(:each) do
      owner = Owner.create({money: 0, candy: 0})
      Machine.new({location: "902 broadway", candy_price: 0.25})
      machine.owner = owner
      machine.save
    end

    it "reduces owner's money by .01 per piece of candy" do

      owner.money = 500
      expect { owner.buy_candy( 500 ) }.to change { owner.money }.by(-5)

    end

    it "increases candy by 1 per piece purchased" do

      owner.money = 500
      expect { owner.buy_candy( 500 ) }.to change { owner.candy }.by(500)

    end

    it "can't buy candy if owner does not have enough money" do

      expect { owner.buy_candy( 500 ) }.to change { owner.candy }.by(0)
      expect { owner.buy_candy( 500 ) }.to change { owner.money }.by(0)

    end


  end
end