class Owner < ActiveRecord::Base
  attr_accessible :candy, :money
  has_many :machines
  after_initialize :set_default
  validates :money, numericality: true
  MONEY = 1000
  CANDY = 7000

  def set_default
    if self.money.nil?
      self.money = Owner::MONEY
    end

    if self.candy.nil?
      self.candy = Owner::CANDY
    end
  end

  def buy_candy(numCandy)
    self.candy += numCandy
    self.money -= (numCandy*0.01)
  end

  def take_money(machine, money)
    machine.money -= money
    self.money += money
  end

  def restock_candy(machine, candy)
    candy_space = 500 - machine.candy
    max_candy = (candy > self.candy)? self.candy : candy
    if candy_space > max_candy
      machine.candy += max_candy
      self.candy -= max_candy
    else
      machine.candy += candy_space
      self.candy -= candy_space
    end
  end
end
