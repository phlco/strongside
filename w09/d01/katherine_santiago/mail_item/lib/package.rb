class Package < Mailitem

  def initialize
    @content = []
  end

  def content
    @content
  end

  def is_fragile?
    true
  end

  def is_broken?
    if (is_fragile? && shake)
      true
    end
  end

  def shake
    true
  end

end