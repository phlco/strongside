class School
  attr_accessor :name, :db
  def initialize(name)
    @name = name
    @db = {}
  end
  def add(name, grade)
    if @db[grade]
      @db[grade] << name
    else @db[grade] = [name]
    end
  end
  def grade(num)
    @db[num]
  end
  def sort
    @db.each do |key, value|
      value.sort!
    end
    Hash[@db.sort]
  end
end
