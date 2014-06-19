# == Schema Information
#
# Table name: machines
#
#  id          :integer          not null, primary key
#  candy       :integer
#  money       :decimal(, )
#  location    :string(255)
#  owner_id    :integer
#  candy_price :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Machine < ActiveRecord::Base
  attr_accessible :candy, :candy_price, :location, :money, :owner_id

  belongs_to :owner

  validates :owner_id, presence: true

  after_initialize :set_defaults

  START_CANDY = 400
  MAX_CANDY = 500
  MIN_CANDY = 0
  START_MONEY = BigDecimal("0.00")
  CANDY_PRICE = BigDecimal("0.25")

  def set_defaults
    if self.candy.nil?
      self.candy = Machine::START_CANDY
    end
    if self.money.nil?
      self.money = Machine::START_MONEY
    end
    if self.candy_price.nil?
      self.candy_price = Machine::CANDY_PRICE
    end
  end

  def dispense
    if self.candy > MIN_CANDY
      self.candy -= 1
      self.money += self.candy_price
    end
  end


end
