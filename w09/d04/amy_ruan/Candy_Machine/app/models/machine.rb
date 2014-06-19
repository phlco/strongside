class Machine < ActiveRecord::Base
  attr_accessible :candy, :candy_price, :location, :money, :owner_id
  belongs_to :owner

  validates :money, numericality: true
  validates :location, presence: true
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

  def sell_candy(num)
    max_num = (num > self.candy)? self.candy : num
    money_gained = self.candy_price * max_num
    self.money += money_gained
    self.candy -= max_num
  end
end
