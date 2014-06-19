class Owner < ActiveRecord::Base
  attr_accessible :candy, :money
  has_many :machines

  validates_presence_of :money, :candy


  def take_money( machine, amount )

    if machine.money >= amount
      machine.money -= amount
      self.money += amount
    else
      self.money += machine.money
      machine.money = 0
    end
  end

  def restock( machine, amount )

    if amount > self.candy
      amount = self.candy
    end

    if ( machine.candy + amount ) <= 500
      machine.candy += amount
      self.candy -= amount
    else
      machine.candy = 500
    end
  end

  def buy_candy( amount )

    if self.money >= amount * 0.01
      self.money -= amount * 0.01
      self.candy += amount
    end

  end

end

