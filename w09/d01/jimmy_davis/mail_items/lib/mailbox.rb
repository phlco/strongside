class Mailbox

  def initialize
    @items = [1,2]
  end

  def items
    @items
  end

  def accept_mail(item)
    @items << item
  end

  def open_mail
    @items.first
  end

  def to_s
    # return "The mailbox has 16 postcards and 3 packages."
    return "The mailbox has #{@items.length.to_s} postcards and #{@items.length.to_s} packages"
  end

end
