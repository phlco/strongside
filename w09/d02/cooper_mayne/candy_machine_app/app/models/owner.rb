class Owner < ActiveRecord::Base
  after_initialize :set_defaults
  attr_accessible :candy, :money, :name

  validates :name, presence: true
  validates :candy, presence: true, numericality: true
  validates :money, presence: true

  START_CANDY = 0
  START_MONEY = 0

  def set_defaults
    self.candy ||= START_CANDY
    self.money ||= START_MONEY
  end
end
