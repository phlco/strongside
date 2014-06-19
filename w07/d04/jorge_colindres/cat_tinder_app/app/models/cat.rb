# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  age        :integer
#  tag_line   :string(255)
#  img_url    :text
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cat < ActiveRecord::Base
  attr_accessible :name, :age, :tag_line, :img_url, :score
end
