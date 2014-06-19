# == Schema Information
#
# Table name: owners
#
#  id         :integer          not null, primary key
#  money      :decimal(, )
#  candy      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Owner do
  let (:owner) { Owner.create({money: BigDecimal("0.00")})}
  let (:machine) {owner.machines.create}
  it "takes money from the machine" do
    money = machine.money
    owner.take_money(machine)
    expect(owner.money).to eq(money)
  end
end
