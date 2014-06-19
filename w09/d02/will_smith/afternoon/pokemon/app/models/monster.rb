class Monster < ActiveRecord::Base
  attr_accessible :energy, :health, :name, :species, :trainer_id

  belongs_to :trainer

  validates :name, presence: true
  validates :trainer_id, presence: true

end
