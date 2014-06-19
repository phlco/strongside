class Mailbox

  def initialize
    @mailitem = []
  end

  def mailitem
    @mailitem
  end

  def accept_mail(input)
    @mailitem.push(input)
  end



end