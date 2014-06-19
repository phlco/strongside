class School

  def initialize(options ={})
    @name = options[:name]
    @db = {}
  end

  def db
    @db
  end

  def name
    @name
  end

  def add(student, grade)
    if @db[grade].nil?
      @db[grade] = [student]
    else
      @db[grade] << student
    end
  end

  def grade(grade)
    grade = grade
    @db[grade]
  end

  def sort
    @db.values.each do |value|
      value.sort!
    end
    @db
  end

end