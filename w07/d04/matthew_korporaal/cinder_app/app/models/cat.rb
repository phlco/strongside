# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  image_url  :string(255)
#  name       :string(255)
#  age        :integer
#  tagline    :string(255)
#  score      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cat < ActiveRecord::Base
  attr_accessible :image_url, :name, :age, :tagline, :score
end
