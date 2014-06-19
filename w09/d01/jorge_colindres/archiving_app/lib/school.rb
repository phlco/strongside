class School

  attr_accessor :db

  def initialize
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
    @db.keys.each do |grade|
      @db[grade].sort!
    end
    @db
  end

end
