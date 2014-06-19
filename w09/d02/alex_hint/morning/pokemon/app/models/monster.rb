class Monster < ActiveRecord::Base
  attr_accessible :energy, :health, :name, :species, :trainer_id
  validates :name, presence: true
  validates :species, presence: true
  validates :trainer_id, presence: true

  belongs_to :trainer
end
