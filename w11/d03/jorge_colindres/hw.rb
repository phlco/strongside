class Array

  def my_map
    newArr = []
    self.length.times do |i|
      el = self[i]
      newArr << yield(el)
    end
    newArr
  end

  def my_map!
    self.length.times do |i|
      el = self[i]
      self[i] = yield(el)
    end
    self
  end

end
