class School
  def initialize(name)
    @name = name
    @students = {}
  end

  def name
    @name
  end

  def db
    @students
  end

  def add(name, grade)
    name_list = []
    name_list << name
    if @students.has_key?(grade)
      @students[grade] << name
    else
      @students[grade] = name_list
    end
  end

  def grade(grade)
    @students[grade]
  end

  def sort
    Hash[@students.sort]
  end

end