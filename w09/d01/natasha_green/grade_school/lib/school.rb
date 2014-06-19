class School

  def initialize(options = {})
    @db = {}  #you will have a database when you create the school and you can put anythiing you want in it
    @name = options[:name]
  end

  def name
    @name
  end

  def db
    @db  #this is just a getter
  end

  def add(student_name, grade)
    @student_name = student_name
    @grade = grade
    @db[grade] = @student_name
  end
end

