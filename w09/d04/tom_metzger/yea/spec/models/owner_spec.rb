require 'spec_helper'

describe Owner do

  let(:owner) { Owner.new(name:"coop") }

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:candy)}
  it {should validate_numericality_of(:candy)}
  it {should validate_presence_of(:money)}

  it "can save" do
    expect(owner.save).to be_true
  end

  context "when created" do

    let(:owner) { Owner.new(name:"coop") }

    it "has money" do
      expect(owner.money).to eq(10.00)
    end

  end

  context "#buy_candy" do
      it "adds to owner's candy" do
      expect{ owner.buy_candy(500)}.to change{ owner.candy }.by(500)
    end

    it "deducts money from the owner if transaction successful" do
      expect{ owner.buy_candy(500)}.to change{ owner.money }.by(-500 * 0.01)
    end
  end

  context "#restock" do
    let(:machine) {Machine.new(location: "123 abc df")}

    it "adds candy and fills the machine if there is too much" do
      expect{ owner.restock(machine, 1000)}.to change{ machine.candy }.by(500)
    end

    it "adds candy to the machine" do
      expect{ owner.restock(machine, 200)}.to change{ machine.candy }.by(200)
    end

  end

end
