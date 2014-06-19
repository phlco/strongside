class Owner < ActiveRecord::Base
  attr_accessible :candy, :money

  has_many :machines

  after_initialize :set_defaults

  # Properties
  # money
  # candy


  DEFAULT_CANDY = 0
  DEFAULT_MONEY = 0.00


  # Take money (takes as an arg the machine)
    # removes money from the machine
    # Restock (takes as an arg the machine as well as the number of candy)

  def take_money(machine, amount)
    if machine.money >= amount
      machine.money -= amount
      self.money += amount
    else
      self.money += machine.money
      machine.money = 0
    end
      # take = machine.money -= amount
      # give = self.money + take
      # give
  end

  def restock(machine, amount)
    if amount > self.candy
      amount = self.candy
    end

  # takes the input for the number of candies to put in
  # but only up until 500
  # say
  # you try to restock a candy machine that has 450 candy in it
  # restock(100)
  # this will only fill it up by 50

    if ( machine.candy + amount) <= 500
      machine.candy += amount
      self.candy -= amount
    else
      machine.candy = 500
    end

  end

  # Buy Candy (takes in the number of candy they want to buy)
  # it costs .01 per 1 pieces of candy
  # removes .01 per 1 pieces of candy purchased
  # increases the level of candy by 1

  def purchase_candy (amount)
    if self.money >= amount * 0.01
      self.money -= amount * 0.01
      self.candy += amount
    end

  end


  def set_defaults
    self.money = Owner::DEFAULT_MONEY
    self.candy = Owner::DEFAULT_CANDY
  end

end

