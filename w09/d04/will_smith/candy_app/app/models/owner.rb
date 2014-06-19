class Owner < ActiveRecord::Base
  attr_accessible :candy, :money, :name

  has_many :machines

  validates :name, presence: true

  after_initialize :set_defaults

  def take_money(machine)
    self.money += machine.money
    machine.money = 0
  end

  def fill(machine, candy)
    if candy.is_a?(Integer)
      machine.candy += candy
      if machine.candy > Machine::MAX_CANDY
        machine.candy = 500
      end
    end
  end

  def buy_candy(candy)
    self.money -= 0.01 * candy
    self.candy += candy
  end

  def set_defaults
    if self.money.nil?
      self.money = 0
    end

    if self.candy.nil?
      self.candy = 0
    end
  end
end
