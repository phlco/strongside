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

end
