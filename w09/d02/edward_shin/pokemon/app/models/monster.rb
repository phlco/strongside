class Monster < ActiveRecord::Base
  attr_accessible :energy, :health, :name, :species, :trainer_id
  validates :trainer_id, presence: true
  validates :name, presence: true
  validates :species, presence: true

  def recover
    self.health += 10
  end

  def attack(monster)
    monster.health -= 10
    self.energy -= 10
  end
end
