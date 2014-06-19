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
      @db[grade] << student
    end
  end

  def grade(grade)
    @db[grade]
  end

  def sort
    @db.values.each do |value|
      value.sort!
    end
    @db
  end


end
