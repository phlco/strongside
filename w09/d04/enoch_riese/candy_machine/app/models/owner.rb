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
  after_initialize :set_defaults

  START_CANDY = 0
  START_MONEY = 0

  def set_defaults
    if self.candy.nil?
      self.candy = Owner::START_CANDY
    end
    if self.money.nil?
      self.money = Owner::START_MONEY
    end
  end
  def take_money(machine)
    money = machine.money
    machine.money = BigDecimal("0.00")
    self.money += money
  end
  def restock(machine, num_candy)
    if num_candy <= self.candy
      add_candy = num_candy
    else
      add_candy = self.candy
    end
    candy_space = Machine::MAX_CANDY - machine.candy
    if candy_space >= add_candy
      self.candy -= add_candy
      machine.candy += add_candy
    else
      machine.candy += candy_space
      self.candy -= candy_space
    end
  end
  def buy_candy(num_candy)
    candy_price = num_candy * BigDecimal("0.01")
    if candy_price < self.money
      self.candy += num_candy
      self.money -= candy_price
    end
  end
end
