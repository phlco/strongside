class Monster < ActiveRecord::Base

  attr_accessible :energy, :health, :name, :species, :trainer_id

  validates :name, presence: true
  validates :species, presence: true
  validates :trainer_id, presence: true

  belongs_to :trainer, dependent: :destroy

  def recover
    self.health += 10 if self.health < 100
    self.energy += 10 if self.energy < 100
  end

  def attack(victim)
    if self.energy >10
      self.energy -= 10
      victim.health -= 10
    end
  end

end
