class Owner < ActiveRecord::Base
  attr_accessible :candy, :money

  has_many :machines

  validates :candy, presence: true
  validates :money, presence: true

  after_initialize :set_defaults

  START_MONEY = 20
  START_CANDY = 0

  def set_defaults
    self.money = Owner::START_MONEY
    self.candy = Owner::START_CANDY
  end

  def buy_candy(num_candy)
    self.money -= num_candy * 0.01
    self.candy += num_candy
  end

  def take_money(machine)
    self.money += machine.money
    machine.money = 0
  end

end
