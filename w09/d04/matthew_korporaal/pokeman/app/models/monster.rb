class Monster < ActiveRecord::Base
  attr_accessible :energy, :health, :name, :species, :trainer_id

  belongs_to :trainer

  validates :name, presence: true
  validates :trainer_id, presence: true

  def recover
    self.health <= 90 ? self.health += 10 : self.health = 100
    self.energy <= 90 ? self.energy += 10 : self.energy = 100
  end

  def attack(victim)
    if self.energy > 10
      self.energy -= 10
      victim.health -= 10
    else
      false
    end
  end
end