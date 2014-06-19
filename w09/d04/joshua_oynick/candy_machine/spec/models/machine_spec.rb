# == Schema Information
#
# Table name: machines
#
#  id          :integer          not null, primary key
#  candy       :integer
#  money       :decimal(, )
#  location    :string(255)
#  owner_id    :integer
#  candy_price :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Machine do

  let(:owner) { Owner.create }

  let(:machine) do
    Machine.new()
  end

  #

  # it "needs and owner" do
  #   expect(machine).to have(1).error_on(:owner_id)
  # end

  it { should validate_presence_of(:owner_id) }


  # it "is valid with an owner_id" do
  #   # owner = Owner.new
  #   machine.owner = owner
  #   machine.valid?
  #   expect(machine.errors).to_not have_key(:owner_id)
  # end

  describe '#sell' do
    let(:machine) do
      machine = Machine.new
      machine.owner = owner
      machine
    end

    it "decreases candy by 1" do
      machine.candy = 400
      machine.dispense
      expect(machine.candy).to be(399)
    end

    it "cannot have less than 0 candy" do
      machine.candy = 0
      machine.dispense
      expect(machine.candy).to be (0)
    end

    it "increases money by 1.00" do
      machine.money = BigDecimal("1.00")
      machine.receive_money
      expect(machine.money).to eq(BigDecimal("2.00"))
    end
  end


end
