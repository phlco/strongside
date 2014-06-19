class Stapler
  attr_accessor :empty, :staple_count

  def initialize
    @staple_count = 0
  end

  def staple
    @staple_count -= 1 unless self.empty?
  end

  def empty?
    @staple_count == 0
  end

  def refill
    @staple_count = 10
  end

end
