class Array

  def my_each
    for item in self
      yield(item)
    end
  end
  def my_each_with_index
    len = self.length

    len.times do |i|
      yield(self[i], i)
    end
  end
  def my_map
    array2 = []
    for item in self
      array2 << yield(item)
    end
    puts array2
  end
  def my_map!
    len = self.length
    len.times do |i|
      self[i] = yield(self[i])
    end
    puts self
  end
  def reject
    array2 = []
    len = self.length
    len.times do |i|
      array2 << self[i] unless yield(self[i])
    end
    puts array2
  end
  def select
    array2 = []
    len = self.length
    len.times do |i|
      array2 << self[i] if yield(self[i])
    end
    puts array2
  end

end
array = ["hey"]
array2 = [1, 2, 3]

array.my_each do |el|
  puts el + "s"
end

array.my_each_with_index do |el, i|
  puts "#{el} is at index #{i}"
end

array.my_map do |el|
  el + "sss"
end

array.my_map! do |el|
  el + "sss"
end

array2.reject do |el|
  el % 2 == 0
end

array2.select do |el|
  el % 2 == 0
end