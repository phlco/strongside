class Monster < ActiveRecord::Base
  attr_accessible :energy, :health, :name, :species, :trainer_id

  belongs_to :trainer

  validates :name, :species, :trainer_id, presence: true


end
