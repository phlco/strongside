class School
  attr_accessor :name, :db

  def initialize(name)
    @name = name
    @db = {}
  end

  def empty
    @db.is_empty?
  end

  def add(student, grade)
    @db[grade] ||= []
    classroom = @db[grade]
    classroom.push(student)
    @db[grade] = classroom
  end

  def grade(num)
    @db.values_at(num).flatten
  end

  def sort
    sorted_db = Hash[@db.sort]
    sorted_db.each do |key, value|
      sorted_db[key] = value.sort
    end
  end

end
