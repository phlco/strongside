class Machine < ActiveRecord::Base
  attr_accessible :candy, :location, :money, :owner_id, :price
  belongs_to :owner
  validates :owner_id, :location, presence: true
  after_initialize :set_defaults

  DEFAULT_CANDY = 0
  MIN_CANDY = 0
  MAX_CANDY = 500
  DEFAULT_MONEY = 0.00
  DEFAULT_PRICE = 0.25
  DISPENSE_AMOUNT = 1

  def sell_candy
    unless self.candy <= MIN_CANDY
      self.candy -= DISPENSE_AMOUNT
      self.money += self.price
    end
  end

  def set_defaults
    self.candy = Machine::DEFAULT_CANDY
    self.money = Machine::DEFAULT_MONEY
    self.price = Machine::DEFAULT_PRICE
  end

end
