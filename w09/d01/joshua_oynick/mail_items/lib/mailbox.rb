class Mailbox

  attr_accessor :mail_items, :accept_mail, :packages, :postcards

  def initialize
    @mail_items = []
    @num_packages = 0
    @num_postcards = 0

  end

  def accept_mail(mail_item)
    if mail_item.is_a?(Postcard)
      @mail_items.push(mail_item)
      @num_postcards += 1
    elsif mail_item.is_a?(Package)
      @mail_items.push(mail_item)
      @num_packages += 1
    end

  end

  def open_mail
    @mail_items.shift
  end

  def to_s
    "The mailbox has #{@num_postcards} postcards and #{@num_packages} packages."
  end

end
