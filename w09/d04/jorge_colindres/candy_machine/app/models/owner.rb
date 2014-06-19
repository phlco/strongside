class Owner < ActiveRecord::Base
  attr_accessible :candy, :money
  has_many :machines
  after_initialize :set_defaults

  DEFAULT_MONEY = 0.00
  DEFAULT_CANDY = 50

  def remove_money(machine)
    self.money += machine.money
    machine.money = 0
  end

  def restock(machine, candy_amount)
    unless self.candy < candy_amount
      unless machine.candy + candy_amount > Machine::MAX_CANDY
        machine.candy += candy_amount
      else
        machine.candy = Machine::MAX_CANDY
      end
    else
      false
    end
  end

  def buy_candy(candy_amount)
    if self.money > (candy_amount / 100.0)
      self.candy += candy_amount
      self.money -= (candy_amount / 100.0 )
    else
      false
    end
  end

  def set_defaults
    self.money = Owner::DEFAULT_MONEY
    self.candy = Owner::DEFAULT_CANDY
  end
end
