class Monster < ActiveRecord::Base
  attr_accessible :energy, :health, :name, :species, :trainer_id

end
