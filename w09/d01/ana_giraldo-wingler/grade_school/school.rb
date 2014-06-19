class School
  attr_accessor :name, :db

  def initialize(name)
    @name = name
    @db = {}
  end

  def add(student, grade)
    @db[grade] = [] if !@db[grade]
    @db[grade] << student
  end

  def grade(grade)
    @db[grade]
  end

  def sort
    sorted_grades = @db.sort
    sorted_hash = {}
    sorted_grades.each do |grade|
      sorted_names = grade[1].sort
      sorted_hash[grade[0]] = [] if !sorted_hash[grade[0]]
      sorted_hash[grade[0]] << sorted_names
      sorted_hash[grade[0]].flatten!
    end
    return sorted_hash
  end

end