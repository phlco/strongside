class School
  attr_accessor :name, :db

  def initialize(name)
    @name = name
    @db = {}
  end

  def add(student, grade)
    if @db[grade].nil?
      @db[grade] = [student]
    else
      array = @db[grade]
      array << student
    end
  end

  def grade(grade)
    @db[grade]
  end

  def sort
    # keys = @db.keys.sort
    # values = @db.values
    # sortedValues = []
    # values.each do |innerArray|
    #   sortedValues << innerArray.sort
    # end
    # @db = keys.zip(sortedValues)
    @db.keys.each do |grade|
      @db[grade].sort!
    end
    @db
  end

end