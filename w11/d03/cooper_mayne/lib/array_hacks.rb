require 'pry'

class Array
  def my_each
    for item in self
      yield(item)
    end    
  end

  def my_each_with_index
    self.length.times {|i| yield(i,self[i])}
  end

  def my_map
    a = []
    for item in self
      a << yield(item)
    end
    return a
  end

  def my_map!
    self.length.times do |i| 
      self[i] = yield(self[i])
    end
    return self
  end

  def my_select
    a = []
    for item in self
      a << item if yield(item)
    end
  end

  def my_sort
    a = []
    for item in self

    end
  end
end

#['what','are','we','doing'].my_each { |something| puts something }
#['what','are','we','doing'].my_each_with_index { |i,v| puts i,v }
#a = ['cooper','blanket','house','computer']
#a.my_map!{ |x| x+'s' }.to_s
#puts a
#b = ['cooper','blanket','house','computer']
#b.my_map{ |x| x+'s' }.to_s
#puts b

#puts [1,2,3,4,5,6].select {|a| a>3 }


