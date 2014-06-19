class School

  attr_accessor :name, :db

  def initialize(name)
    @name = name
    @db = {}
  end

  def add(name, grade)
    if db.keys.include?(grade)
      db[grade] << name
    else
      db[grade] = [name]
    end
  end

  def grade(grade_number)
    db[grade_number]
  end

  def sort
    new_object = {}
    self.keys.sort.each do |key|
      new_object[key] = self[key].sort
    end
    new_object
  end

end
