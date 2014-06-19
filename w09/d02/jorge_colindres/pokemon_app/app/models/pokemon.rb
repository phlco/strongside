class Pokemon < ActiveRecord::Base
  belongs_to :trainer
  validates :trainer_id, presence: true
  validates :name, presence: true
  validates :species, presence: true
  attr_accessible :energy, :health, :name, :species, :trainer_id

  def recover
    if (self.health + 10) > 100
      self.health = 100
    else
      self.health += 10
    end

    if (self.energy + 10) > 100
      self.energy = 100
    else
      self.energy += 10
    end
  end

  def attack(victim)
    if self.energy >= 10
      self.energy -= 10
      victim.health -= 10
    else
      false
    end
  end

end
