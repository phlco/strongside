class Machine < ActiveRecord::Base
  attr_accessible :candy, :candy_price, :location, :money, :owner_id
  belongs_to :owner

  validates :location, presence: :true
  validates :candy_price, presence: :true
  validates :owner_id, presence: :true

  after_initialize do
    self.candy = 0
    self.money = 0.00
    self.candy_price = 0.25
  end

  def refill(amount)
    if amount <= 500
      self.candy = amount
    elsif amount > 500
      self.candy = 500
    else
    end
  end

  def sell_candy(amount)
    self.candy -= amount
    self.money += amount * self.candy_price
  end

end
