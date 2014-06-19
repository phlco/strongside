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

  def my_keep_if
    new_letters = []
    len = self.length
    len.times do |i|
      el = self[i]
      if yield(el) == 0
        new_letters << el
      end
    end
    return new_letters
  end

  def my_take_while
    new_letters = []
    len = self.length
    len.times do |i|
      el = self[i]
      if yield(el) == true
        new_letters << el
      end
    end
    return new_letters
  end


end







# my_array = ["apple", "bear", "cherry"]


# o = my_array.my_map{ |el| el.upcase }
# p o

# a = %w{a b c d e f g h i j k l m n}

# a.my_select{|v| v =~ /[aeiou]/}


# b = %w{a b c d e f g h i j k l m n}

# c= b.my_keep_if{|v| v =~ /[aeiou]/}

# p c

n = [1, 2, 3, 4, 5, 0]
q = n.my_take_while {|i| i < 4 }

p q