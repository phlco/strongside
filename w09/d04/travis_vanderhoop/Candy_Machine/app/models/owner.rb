class Owner < ActiveRecord::Base
  attr_accessible :candy, :money
  has_many :machines
  after_initialize :set_default

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

  def restock_machine(machine)
    candies_added = 500 - machine.candy
    self.candy -= candies_added
    machine.candy += candies_added
  end

end
