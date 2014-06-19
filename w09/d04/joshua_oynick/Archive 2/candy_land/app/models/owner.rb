class Owner < ActiveRecord::Base

  has_many :machines

  attr_accessible :name, :candy, :money

  validates :name, presence: true
  validates :candy, presence: true, numericality: true
  validates :money, presence: true, numericality: true

  after_initialize :set_defaults

  DEFAULT_MONEY = 0
  DEFAULT_CANDY = 0

  COST_OF_CANDY = 0.01

  def buy_candy(num_candies)
    total_cost = num_candies * COST_OF_CANDY
    checkout_cost = [total_cost, self.money].min
    checkout_amount = checkout_cost / COST_OF_CANDY

    self.money -= checkout_cost
    self.candy += checkout_amount

    self.save

    return checkout_amount
  end

  def take_money(machine)
    return nil if machine.owner != self

    money = machine.remove_money
    self.money += money
    self.save

    return money
  end

  def restock_machine(machine, attempted_quantity)
    return nil if machine.owner != self

    quantity = [attempted_quantity, self.candy].min
    quantity_filled = machine.refill(quantity)
    self.candy -= quantity_filled

    self.save

    return quantity_filled
  end

  private

  def set_defaults
    self.money ||= DEFAULT_MONEY
    self.candy ||= DEFAULT_CANDY
  end





end
