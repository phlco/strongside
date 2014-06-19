class Monster < ActiveRecord::Base
  attr_accessible :energy, :health, :name, :species, :trainer_id

  belongs_to :trainer

  validates :name, presence: true
  validates :trainer_id, presence: true

  after_initialize :set_defaults

  START_HEALTH = 80
  START_ENERGY = 80
  MAX_HEALTH = 100
  MAX_ENERGY = 100


  def attack(other_monster)
    if self.energy >= 10
      self.energy -= 10
      other_monster.injure(10)
      return true
    else
      return false
    end
  end

  def injure(damage)
    self.health -= damage
    if self.health < 0
      self.health = 0
    end
  end

  def recover
    self.recover_health
    self.recover_energy

    self.save

    self
  end

  def recover_health
    self.health += 10
    if self.health > MAX_HEALTH
      self.health = 100
    end
  end

  def recover_energy
    self.energy += 10
    if self.energy > MAX_HEALTH
      self.energy = 100
    end
  end

  def set_defaults

    if self.health.nil?
      self.health = Monster::START_HEALTH
    end

    if self.energy.nil?
      self.energy = Monster::START_ENERGY
    end

  end

end

