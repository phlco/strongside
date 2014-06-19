class Pokemon < ActiveRecord::Base
  belongs_to :trainer
  validates :trainer_id, presence: true

  attr_accessible :energy, :health, :name, :trainer_id, :species

  validates :name, presence: true
  validates :species, presence: true

  def recover
    self.health += 10 unless self.health >= 100
  end

  def attack victim
    victim.health -= 10
    self.energy -= 10
    self.save
    victim.save
  end

end
