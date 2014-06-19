class Machine < ActiveRecord::Base

  belongs_to :owner

  attr_accessible :candy, :location, :money, :owner_id, :price

  validates :candy, presence: true
  validates :location, presence: true
  validates :money, presence: true
  validates :price, presence: true
  validates :owner_id, presence: true

  after_initialize :set_defaults

  START_MONEY = 0
  START_CANDY = 0
  START_PRICE = 0.25

  def set_defaults
    self.money = Machine::START_MONEY
    self.candy = Machine::START_CANDY
    self.price = Machine::START_PRICE
  end
end
