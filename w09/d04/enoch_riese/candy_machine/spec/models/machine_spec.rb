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
  it "starts out with no money" do
    expect(machine.money).to eq(BigDecimal("0.00"))
  end

  # it "is valid with an owner_id" do
  #   # owner = Owner.new
  #   machine.owner = owner
  #   machine.valid?
  #   expect(machine.errors).to_not have_key(:owner_id)
  # end

  describe 'dispense method' do
    before(:each) do
      @machine = Machine.new({money: BigDecimal("1.00")})
      @machine.owner = owner
    end

    it "decreases candy by 1" do
      @machine.candy = 400
      @machine.dispense
      expect(@machine.candy).to be(399)
    end

    it "cannot have less than 0 candy" do
      @machine.candy = 0
      @machine.dispense
      expect(@machine.candy).to be (0)
    end

    it "increases money by .25" do
      @machine.dispense
      expect(@machine.money).to eq(BigDecimal("1.25"))
    end
  end


end
