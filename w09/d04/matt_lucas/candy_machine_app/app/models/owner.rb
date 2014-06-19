class Owner < ActiveRecord::Base
  attr_accessible :candy, :money, :name, :van

  validates :name, presence: true
  validates :money, presence: true
  validates :van, presence: true

  after_initialize :set_defaults

  START_MONEY = 50
  START_CANDY = 0

  def buy_candy(num, price)
    self.candy += num
    self.money -= (num * price)
  end

  def set_defaults
    if self.money.nil?
      self.money = Owner::START_MONEY
    end

    if self.candy.nil?
      self.candy = Owner::START_CANDY
    end
  end

end
