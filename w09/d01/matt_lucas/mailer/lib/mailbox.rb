class Mailbox

  def initialize
    @contents = []
  end

  def contents
    @contents
  end

  def accept_mail(item)
    @contents << item
  end

  def open
    @contents.shift
  end

  def to_s
    package = 0
    postcard = 0
    @contents.each do |t|
      if t.class == Package
        package += 1
      else t.class == Postcard
        postcard += 1
      end
    end
    return "The mailbox has #{postcard} postcard and #{package} package"
  end

end
