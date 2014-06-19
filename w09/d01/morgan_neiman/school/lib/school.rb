class School
  attr_accessor :db
  def initialize
    @db = {}
  end
  def add(student, grade)
    @db[grade].nil? ? @db[grade] = [student] : @db[grade] << student
  end
  def grade(grade)
    @db[grade]
  end
  def sort
    db_array = @db.sort
    sorted_db = {}
    db_array.each do |arr|
      sorted_db[arr[0]] = arr[1].sort
    end
    return sorted_db
  end
end