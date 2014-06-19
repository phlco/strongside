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

class Owner < ActiveRecord::Base
  attr_accessible :candy, :money

  has_many :machines

  def take_money(machine)
    money = machine.money
    machine.money = 0
    self.money += money
  end

end
