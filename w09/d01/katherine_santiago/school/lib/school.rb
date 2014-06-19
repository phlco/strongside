class School

  def initialize(name)
    @db = {}
  end

  def db
    @db
  end

  def add(name, grade)

    if @db[grade].nil?
      @db[grade] = [].push(name)
    else
      @db[grade] = @db[grade].push(name)
    end
  end

  def grade(grade_level)
    @db[grade_level]
  end

  def sort
    sorted_keys = @db.keys.reverse!
    sorted_keys.each do |key|
      @db[key].sort!
    end
    @db
  end

end
