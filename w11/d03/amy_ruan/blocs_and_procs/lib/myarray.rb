require 'pry'

class Array
  def run_my_own_function
    puts "I ran my own function"
  end #this is an instance method not a class. it is called in the instance of the array!!!! (set variable)

  def my_each
    len = self.length
    len.times do |i|
      yield(self[i])
    end
  end

  def my_each_with_index
    len = self.length
    len.times do |i|
      yield(self[i], i)
    end
  end

  def my_map
    len = self.length
    new_array = []
    len.times do |i|
      a = yield(self[i])
      new_array << a
    end
    print new_array
  end

  def my_map!
    len = self.length
    len.times do |i|
      a = yield(self[i])
      self[i] = a
    end
    print self
  end

  def my_reduce(parameter)
    len = self.length
    if len > 1
      new = 0
      len.times do |i|
        if i < 1
          new = yield(self[i], self[i+1])
        elsif i == 1
        else
          new = yield(new, self[i])
        end
      end
      puts new
    else
      puts new = self
    end
    return new
  end

  def my_reject
  len = self.length
  new_arr = []
    len.times do |i|
      check = yield(self[i])
      if !check
        new_arr << self[i]
      end
    end
  return new_arr
  end

  def my_select
  len = self.length
  new_arr = []
    len.times do |i|
      check = yield(self[i])
      if check
        new_arr << self[i]
      end
    end
  return new_arr
  end
end


array = [2,5,7,8,9]

array.my_select do |i|
  i > 3
end


array.my_reduce do |x, y|
  x + y
end

array.my_reject do |i|
  i > 3
end

array.my_map do |i|
   i*2
end

array.my_map! do |i|
   i*2
end

