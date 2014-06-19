# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  age        :integer
#  tag_line   :string(255)
#  image_url  :string(255)
#  rating     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cat < ActiveRecord::Base
  attr_accessible :age, :name, :tag_line, :score, :image_url, :rating
end
