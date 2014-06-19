class Owner < ActiveRecord::Base
  after_initialize :set_defaults
  attr_accessible :candy, :money, :name

  has_many :machines

  validates :name, presence: true
  validates :candy, presence: true, numericality: true
  validates :money, presence: true

  START_CANDY = 0
  START_MONEY = 10.00
  CANDY_PRICE_OWNER = 0.01

  def set_defaults
    self.candy ||= START_CANDY
    self.money ||= START_MONEY
  end

  def buy_candy(pieces_of_candy)
    if self.money > self.wholesale_candy_cost(pieces_of_candy)
      self.money -= self.wholesale_candy_cost(pieces_of_candy)
      self.candy += pieces_of_candy
    end
  end

  def wholesale_candy_cost(pieces_of_candy)
    pieces_of_candy * CANDY_PRICE_OWNER
  end

  def restock(machine, pieces_of_candy)
    fill_result = machine.fill(pieces_of_candy)
    if fill_result > 0
      "You tried to over-fill the machine.  It is now full with 500 pieces of candy."
    else
      "The machine now has #{machine.candy} pieces of candy."
    end
  end
end
