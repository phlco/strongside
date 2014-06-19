class Monster < ActiveRecord::Base
  attr_accessible :energy, :health, :name, :species, :trainer_id

  belongs_to :trainer

  validates :name, presence: true
  validates :trainer_id, presence: true

  after_initialize do
    self.energy = 80
    self.health = 80
  end

  def recover
    self.energy < 100 ?  self.energy += 10 : return
    self.health < 100 ? self.health += 10 : return
  end
  def attack(enemy)
    if( self.energy > 0 )
      self.energy -= 10
      enemy.health -= 10
    end
  end

end
