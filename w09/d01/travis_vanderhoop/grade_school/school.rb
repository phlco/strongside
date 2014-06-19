class School
  attr_accessor :name
  attr_reader :db

  def initialize(school_name)
    @name = school_name
    @db = {}
  end

  def add(student_name, grade)
    if (@db.has_key?(grade))
      @db[grade] << student_name
      @db[grade].sort!
    else
      @db[grade] = [] << student_name
      @db[grade].sort!
    end
  end

  def grade(grade)
    @db[grade]
  end

  def sort
    Hash[@db.sort]
  end

end
