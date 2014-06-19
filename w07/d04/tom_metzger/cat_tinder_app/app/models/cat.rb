# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  age        :integer
#  score      :integer          default(0)
#  tag_line   :text
#  image_url  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cat < ActiveRecord::Base
  attr_accessible :name, :age, :score, :tag_line, :image_url

end
