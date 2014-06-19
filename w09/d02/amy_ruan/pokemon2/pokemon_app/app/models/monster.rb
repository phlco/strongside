class Monster < ActiveRecord::Base
  attr_accessible :energy, :health, :name, :species, :trainer_id
  validates :name, presence: true
  validates :species, presence: true
  validates :trainer_id, presence: true
  belongs_to :trainer

  def recover
    self.health = self.health<=90? self.health+=10:100
    self.energy = self.energy<=90? self.energy+=10:100
  end

  def attack(opponent)
    if self.energy > 10
      self.energy -= 10
      opponent.health = opponent.health > 10? opponent.health-=10:0
    else
      "You do not have enough energy"
    end
  end

end
