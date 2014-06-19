require 'pry'
class School  
  attr_accessor :name, :db

  def initialize name
    @name = name
    @db = {}
  end

  def add ( student,grade )
    @db[grade] ||= []
    @db[grade] << student
  end

  def grade_roster grade
    @db[grade] || []
  end

  def sorted_roster
    db = @db.to_a
    db.sort!
    db.each do |grade|
      grade[1].sort!
    end  
  
  end

end
