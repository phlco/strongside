class School
  attr_accessor :name, :db

  def initialize(name)
    @name = name
    @db = {}
  end

  def add(name, grade)
    if @db[grade].nil?
      @db[grade] = []
    end
    @db[grade] << name
  end

  def grade(num)
    @db[num]
  end

  def sort
    # sort values, then keys
    @db.values.each do |value|
     value.sort!
    end
    Hash[@db.sort.reverse]
 end

end