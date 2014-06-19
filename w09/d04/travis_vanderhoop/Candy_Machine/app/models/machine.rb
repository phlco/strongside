class Machine < ActiveRecord::Base
  attr_accessible :candy, :candy_price, :location, :money, :owner_id
  belongs_to :owner

  validates :location, :presence => true
  after_initialize :set_default
  CANDY = 0
  MONEY = 0.00
  CANDY_PRICE = 0.25

  def set_default
    if self.candy.nil?
      self.candy = Machine::CANDY
    end

    if self.money.nil?
      self.money = Machine::MONEY
    end

    if self.candy_price.nil?
      self.candy_price = Machine::CANDY_PRICE
    end
  end

  def sell_candy
    if self.candy > 0
      self.candy -= 1
      self.money += self.candy_price
    else
    end
  end

end
