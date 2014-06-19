class Machine < ActiveRecord::Base
  attr_accessible :candy, :candy_price, :location, :money
  after_initialize :set_defaults, :if => :new_record?

  DEFAULT_CANDY = 0
  MIN_CANDY = 0
  MAX_CANDY = 500
  DEFAULT_PRICE = 0.25
  DEFAULT_MONEY = 0.00
  DISPENSE_AMOUNT = 1

  def set_defaults
    self.candy = Machine::DEFAULT_CANDY
    self.candy_price = Machine::DEFAULT_PRICE
    self.money = Machine::DEFAULT_MONEY
  end

  def sell_candy
    unless self.candy <= MIN_CANDY
      self.candy -= DISPENSE_AMOUNT
      self.money += self.candy_price
    end
  end

  def refill
    self.candy = MAX_CANDY
  end

  def cashout
    self.money = 0
  end
end
