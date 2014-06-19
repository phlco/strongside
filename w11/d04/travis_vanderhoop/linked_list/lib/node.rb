require 'pry'

class Node

  attr_accessor :value, :nxt

  def initialize(value)
    @value = value
    @nxt = nil
  end

  def to_string
  end

end
