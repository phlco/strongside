class Cat < ActiveRecord::Base
   attr_accessible :name, :score, :age, :tagline, :img_url

   validates :name, presence: true
   validates :img_url, presence: true
   validates :age, presence: true
   validates :tagline, presence: true
   validates_format_of :img_url, :with => %r{\.(png|jpg|jpeg)$}i, :message => "must be an image"

   def self.highestScore
     Cat.all.sort_by{|cat| cat.score}.last
   end

   def self.pickRandom
     Cat.all.sample
   end
end
