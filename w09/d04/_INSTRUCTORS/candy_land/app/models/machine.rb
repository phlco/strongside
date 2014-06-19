class Machine < ActiveRecord::Base

  attr_accessible :candy, :candy_price, :location, :money, :owner_id

  belongs_to :owner

  validates :candy, presence: true, numericality: true
  validates :candy_price, presence: true, numericality: true
  validates :money, presence: true, numericality: true

  after_initialize :set_defaults

  DEFAULT_CANDY = 0
  DEFAULT_MONEY = 0
  DEFAULT_CANDY_PRICE = 0.25
  MAX_CANDY = 500

  def refill(quantity)
    potential_quantity = self.candy + quantity
    if potential_quantity > MAX_CANDY
      self.candy = MAX_CANDY
      quantity_filled = potential_quantity - MAX_CANDY
    else
      self.candy = potential_quantity
      quantity_filled = quantity
    end

    return quantity_filled
  end

  def sell
    if self.candy > 0
      self.candy -= 1
      self.money += self.candy_price
      return self.save
    else
      return false
    end
  end

  def remove_money
    money_removed = self.money
    self.money = 0
    return money_removed
  end

  private

  def set_defaults
    self.candy ||= DEFAULT_CANDY
    self.money ||= DEFAULT_MONEY
    self.candy_price ||= DEFAULT_CANDY_PRICE
  end

end
