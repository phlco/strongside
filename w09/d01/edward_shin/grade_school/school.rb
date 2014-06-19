class School

  def initialize(name)
    @name = name
    @student = {}
  end

  def name
    @name
  end

  def db
    @student
  end

  def add(name, grade)
    if @student.has_key?(grade)
      @student[grade] << name
    else
      @student[grade] = [name]
    end
  end

  def grade(grade)
    @student[grade]
  end

  def sort
   sorted_array = Hash[@student.sort]
   sorted_array.each_value do |value|
    value.sort!
   end
  end
end