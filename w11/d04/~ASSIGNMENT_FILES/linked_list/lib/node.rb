require 'pry'

class Node

  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end

  def to_s
    if @next.nil?
      next_value = "nil"
    else
      next_value = @next.value
    end

    "<value: #{@value}, next: #{next_value}>"
  end

end
