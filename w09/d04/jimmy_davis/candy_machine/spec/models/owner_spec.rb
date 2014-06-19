require 'spec_helper'

describe Owner do

  let(:owner) do
    Owner.create
  end

  let(:machine) do
    Machine.create(
      location: "902 Broadway",
      owner_id: owner.id
    )
  end


  context "when created" do

    it "has 0 candy when created" do
      expect(owner.candy).to eq(Owner::DEFAULT_CANDY)
    end

    it "has 0 money when created" do
      expect(owner.money).to eq(Owner::DEFAULT_MONEY)
    end

    it "has 0 machines when created" do
      expect(owner.machines).to eq([])
    end

  end

  describe "#take_money" do

    it "can take money from the machine" do
      machine.money = 10.00
      expect { owner.take_money(machine, 5.00) }.to change { machine.money }.by(-5.00)
    end

    it "increases owners money when it takes money from machine" do
      machine.money = 10.00
      expect { owner.take_money( machine, 5.00 ) }.to change { owner.money }.by(5.00)
    end

  end

  describe "#restock" do

    it "can restock the machine with candy if has candy" do
      owner.candy = 100
      expect { owner.restock(machine, 100) }.to change { machine.candy }.by(100)
    end

    it "can not restock machine if it has no candy" do
      owner.candy = 0
      expect { owner.restock( machine, 100 ) }.to change { machine.candy }.by(0)
    end

    it "can not exceed 500" do
      owner.candy = 600
      expect { owner.restock(machine, 600) }.to change { machine.candy }.by(500)
    end

    it "decreases owner's candy when machine is restocked" do
      owner.candy = 100
      expect { owner.restock( machine, 50 ) }.to change { owner.candy }.by(-50)
    end


  end

  describe "#purchase_candy" do


    it "reduces owner's money by .01 per piece of candy" do
      owner.money = 100.00
      expect { owner.purchase_candy( 100 ) }.to change { owner.money }.by(-1.00)
    end

    it "increases candy by 1 per piece purchased" do
      owner.money = 100.00
      expect { owner.purchase_candy( 100 ) }.to change { owner.candy }.by(100)
    end

  end

end
