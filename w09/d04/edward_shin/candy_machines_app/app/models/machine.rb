class Machine < ActiveRecord::Base
  attr_accessible :candy, :candy_price, :location, :money, :owner_id
  belongs_to :owner

  after_initialize :set_defaults
  validates :location, presence: true
  validates :owner_id, presence: true

  def set_defaults
    if self.candy.nil?
      self.candy = 0
    end
    if self.money.nil?
      self.money = 0.00
    end
    if self.candy_price.nil?
      self.candy_price = 0.50
    end
  end

  def sell
    self.candy -=1
    self.money += self.candy_price
  end
end
