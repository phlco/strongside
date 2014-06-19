class School
  attr_accessor :name, :db

  def initialize(name)
    @name = name
    @db = {}
  end

  def add(student_name, student_grade)
    if @db.has_key?(student_grade)
      @db[student_grade].push(student_name)
    else
      @db[student_grade] = [student_name]
    end
  end

  def grade(grade_num)
    @db[grade_num]
  end



end
