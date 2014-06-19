require 'pry'

class Array

  def my_map
    new_array = []
    len = self.length
    len.times do |i|
      el = self[i]
      new_array << yield(el)
    end
    return new_array
  end

  def my_select
    new_letters = []
    len = self.length
    len.times do |i|
      el = self[i]
      if yield(el) == 0
        new_letters << el
      end
    end
    p new_letters
  end


end

MY MAP TEST
my_array = ["apple", "pear", "cherry"]
o = my_array.my_map{ |el| el.upcase }
p o

SELECT TEST
a = %w{a b c d e f g h i j k l m n}
a.my_select{|v| v =~ /[aeiou]/}