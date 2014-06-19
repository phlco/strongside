require 'spec_helper'

describe Machine do

  describe "validations" do

    it { should belong_to(:owner) }

    it { should validate_presence_of :candy }
    it { should validate_numericality_of :candy }

    it { should validate_presence_of :candy_price }
    it { should validate_numericality_of :candy_price }

    it { should validate_presence_of :money }
    it { should validate_numericality_of :money }

  end

  describe '.new' do

    context ("when passed no parameters") do

      let!(:machine) { Machine.new }

      it "has 0 candy" do
        expect(machine.candy).to eq(0)
      end

      it "has 0 money" do
        expect(machine.money).to eq(0.00)
      end

      it "has a default candy price" do
        expect(machine.candy_price).to be >= 0
      end

      it "can be saved" do
        expect(machine.save).to be_true
      end

    end

    context ("when passed candy, money, and candy price") do

      let!(:machine) do
        Machine.new(
          candy: 10,
          money: 10.00,
          candy_price: 1.00
        )
      end

      it "candy is set properly" do
        expect(machine.candy).to eq(10)
      end

      it "money is set properly" do
        expect(machine.money).to eq(10.00)
      end

      it "candy_price is set properly" do
        expect(machine.candy_price).to eq(1.00)
      end

      it "can be saved" do
        expect(machine.save).to be_true
      end

    end

  end

  describe '#sell' do

    context "when it has a candy price of 0.99 and 0 money" do

      let(:machine) do
        Machine.create(
          money: 0.00,
          candy_price: 0.99
        )
      end

      context "and when it has 1 candy" do

        before(:each) do
          machine.update_attributes(candy: 1)
        end

        it "increases money by 1.00" do
          expect { machine.sell }.to change { machine.money }.by(0.99)
        end

        it "decreases candy by 1" do
          expect { machine.sell }.to change { machine.candy }.by(-1)
        end

      end

      context "and when it has 0 candy" do

        before(:each) do
          machine.update_attributes(candy: 0)
        end

        it "money remains unchanged" do
          expect { machine.sell }.to change { machine.money }.by(0)
        end

        it "candy remains at 0" do
          expect { machine.sell }.to change { machine.candy }.by(0.0)
        end

      end

    end

  end

end
