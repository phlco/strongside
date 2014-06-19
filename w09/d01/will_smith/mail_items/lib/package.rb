class Package < Mailitem
  def content
    @content = []
  end

  def is_fragile?
    true
  end

  def is_broken?
    false
  end
end
