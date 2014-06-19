require 'spec_helper'

describe Owner do

  it { should have_many(:machines) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:candy) }
  it { should validate_numericality_of(:candy) }

  it { should validate_presence_of(:money) }
  it { should validate_numericality_of(:money) }

  describe '.new' do

    context "when passed no parameters" do

      let!(:owner) { Owner.new }

      it "has 0.00 money" do
        expect(owner.money).to eq(0.00)
      end

      it "has 0 candy" do
        expect(owner.candy).to eq(0)
      end

    end

    context "when passed a name" do
      let!(:owner) do
        Owner.new(name: "Jonathan")
      end

      it "can be saved" do
        expect(owner.save).to be_true
      end

    end

  end

  describe '#buy_candy (1 candy sells for $0.01)' do

    let!(:owner) do
      Owner.create(name: "Jonathan")
    end

    context("when they have 0.00 money ") do

      before(:each) { owner.update_attributes(money: 0.00) }

      it "cannot buy 1 candy" do
        expect( owner.buy_candy(1) ).to eq(0)
      end

      it "candy remains unchanged" do
        expect { owner.buy_candy(1) }.to change { owner.candy }.by(0)
      end

      it "money remains unchanged" do
        expect { owner.buy_candy(1) }.to change { owner.money }.by(0)
      end

    end

    context("when they have 0.01 money") do

      before(:each) { owner.update_attributes(money: 0.01)}

      context ("and when they want to buy 1 candy") do

        it "can buy 1 candy" do
          expect( owner.buy_candy(1) ).to eq(1)
        end

        it "increases candy by 1" do
          expect { owner.buy_candy(1) }.to change { owner.candy }.by(1)
        end

        it "decreases money by 0.01" do
          expect { owner.buy_candy(1) }.to change{ owner.money }.by(-0.01)
        end

        it "is persisted" do
          owner.buy_candy(1)
          is_not_saved = owner.changed?
          is_saved = !is_not_saved
          expect(is_saved).to be_true
        end

      end

      context ("when tries to buy 2 candy") do

        it "ends up only buying 1 candy" do
          expect( owner.buy_candy(2) ).to eq(1)
        end

        it "increases candy only by 1" do
          expect { owner.buy_candy(1) }.to change { owner.candy }.by(1)
        end

        it "decreases money only by 0.01" do
          expect { owner.buy_candy(1) }.to change{ owner.money }.by(-0.01)
        end

      end

    end

    context("when they have 2.00 money") do

      before(:each) { owner.update_attributes(money: 2.00)}

      it "can buy 100 candy" do
        expect( owner.buy_candy(100) ).to eq(100)
      end

      it "increases candy by 100" do
        expect { owner.buy_candy(100) }.to change { owner.candy }.by(100)
      end

      it "decreases money by 1.00" do
        expect { owner.buy_candy(100) }.to change{ owner.money }.by(-1.00)
      end

    end

  end

  describe 'interacting with machines by' do

    let(:owner) do
      Owner.create(name: "Jonathan")
    end

    describe '#take_money' do

      context("when the owner owns the machine") do


        let(:machine) do
          Machine.create(owner_id: owner.id)
        end

        context("when a machine has 0") do

          before(:each) do
            machine.update_attributes(money: 0.00)
          end

          it "there is no money taken" do
            expect( owner.take_money(machine) ).to eq(0.00)
          end

          it "owner's money does not change" do
            expect{ owner.take_money(machine) }.to change{ owner.money }.by(0.00)
          end

          it "machine's money does not change" do
            expect{ owner.take_money(machine) }.to change{ machine.money }.by(0.00)
          end

        end

        context("when a machine has money") do

          before(:each) do
            machine.update_attributes(money: 9001.00)
          end

          it "takes all the money from the machine" do
            total_money = machine.money
            expect( owner.take_money(machine) ).to eq(total_money)
          end

          it "owner's money increases by the money in the machine" do
            expect{ owner.take_money(machine) }.to change{ owner.money }.by(machine.money)
          end

          it "machine's money goes to 0" do
            expect{ owner.take_money(machine) }.to change{ machine.money }.to(0)
          end

        end

      end

      context ("when a burglar tries to take money from a machine with money") do

        let(:burglar) do
          Owner.create(name: "Burglar")
        end

        let(:machine) do
          Machine.create(owner_id: owner.id, money: 1000000)
        end

        it "they cannot" do
          expect( burglar.take_money(machine) ).to eq(nil)
        end

        it "the burglar's money remains the same" do
          expect{ burglar.take_money(machine) }.to change{ burglar.money }.by(0)
        end

        it "the machine's money remains the same" do
          expect{ burglar.take_money(machine) }.to  change{ machine.money }.by(0)
        end

      end

    end

  end

  describe '#restock_machine' do

    let(:owner) do
      Owner.create(name: "Jonathan")
    end

    context("when a saboteur tries to restock the machine") do

      let(:saboteur) do
        Owner.create(name: "Saboteur", candy: Machine::MAX_CANDY)
      end

      let(:machine) do
        Machine.create(owner_id: owner.id)
      end

      it "it fails" do
        expect( saboteur.restock_machine(machine, 1) ).to be_nil
      end

      it "does not change the machine's candy" do
        expect{ saboteur.restock_machine(machine, 1) }.to change{ machine.candy }.by(0)
      end

      it "does not change the saboteur's candy" do
        expect{ saboteur.restock_machine(machine, 1) }.to change{ saboteur.candy }.by(0)
      end

    end

    context("when the machine's owner restock_machines is") do

      let(:machine) do
        Machine.create(owner_id: owner.id)
      end

      context("when the owner has 1 candy to restock a machine with #{Machine::MAX_CANDY-1}") do

        before(:each) do
          owner.update_attributes(candy: 1)
          machine.candy = Machine::MAX_CANDY-1
        end

        it "1 candy should be restocked" do
          # binding.pry
          expect(owner.restock_machine(machine, 1) ).to eq(1)
        end

        it "machine should gain a candy" do
          expect{ owner.restock_machine(machine, 1) }.to change{ machine.candy }.by(1)
        end

        it "owner should lose a candy" do
          expect{ owner.restock_machine(machine, 1) }.to change{ owner.candy }.by(-1)
        end

      end

      context("when the owner has no candies tries to restock a machine that can hold more") do

        before(:each) do
          owner.update_attributes(candy: 0)
        end

        it "0 candies should be restocked" do
          expect(owner.restock_machine(machine, 1) ).to eq(0)
        end

        it "machine should gain a candy" do
          expect{ owner.restock_machine(machine, 1) }.to change{ machine.candy }.by(0)
        end

        it "owner should lose a candy" do
          expect{ owner.restock_machine(machine, 1) }.to change{ owner.candy }.by(0)
        end

      end

      context("when the owner has 1 candy tries to restock a machine with 2 candies and the machine can hold 2 more") do

        before(:each) do
          owner.update_attributes(candy: 1)
          machine.candy = Machine::MAX_CANDY-2
        end

        it "1 candies should be restocked" do
          expect(owner.restock_machine(machine, 2) ).to eq(1)
        end

        it "machine should gain 1 candy" do
          expect{ owner.restock_machine(machine, 2) }.to change{ machine.candy }.by(1)
        end

        it "owner should lose 1 candy" do
          expect{ owner.restock_machine(machine, 2) }.to change{ owner.candy }.by(-1)
        end

      end


      context("when the owner with enough candies tries to restock a machine with more candy than the machine can hold") do

        before(:each) do
          owner.update_attributes(candy: 2)
          machine.candy = Machine::MAX_CANDY-1
        end

        it "1 candy should be restock_machineed" do
          expect(owner.restock_machine(machine, 2) ).to eq(1)
        end

        it "machine should gain a candy" do
          expect{ owner.restock_machine(machine, 2) }.to change{ machine.candy }.by(1)
        end

        it "owner should lose a candy" do
          expect{ owner.restock_machine(machine, 2) }.to change{ owner.candy }.by(-1)
        end

      end

    end

  end

end
