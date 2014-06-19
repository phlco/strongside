class Owner < ActiveRecord::Base
  attr_accessible :candy, :money, :name
  has_many :machines

  validates :name, presence: true

  after_initialize :set_defaults

  def set_defaults
    if self.money.nil?
      self.money = 0
    end

    if self.candy.nil?
      self.candy = 0
    end
  end
end
