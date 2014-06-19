class Owner < ActiveRecord::Base
  attr_accessible :candy, :money

  has_many :machines

  after_initialize :set_defaults

  START_MONEY = 100.00
  START_CANDY = 500

  def set_defaults
    if self.money.nil?
      self.money = Owner::START_MONEY
    end
    if self.candy.nil?
      self.candy = Owner::START_CANDY
    end
  end

  def takes_money(machine)
    self.money += machine.money
    machine.money = 0
  end

  def restock(machine, amount)
    totes_candy = machine.candy + amount
    if self.candy < 1
      "you have no candy"
    else
      if totes_candy > 500
        machine.candy = 500
        self.candy -= (amount-(500 - machine.candy))
      else
        machine.candy += amount
        self.candy -= amount
      end
    end
    return machine.candy
  end

  def buy_candy(amount)
    self.candy += amount
    cost = amount * 0.01
    self.money -=  cost
  end

end
