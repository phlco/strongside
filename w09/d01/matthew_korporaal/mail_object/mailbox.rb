require_relative 'mail_item'

class Mailbox < MailItem

  attr_accessor :mail_items

  def initialize
    @mail_items = []
  end

  def accept_mail(mail)
    # 'mail' must be a mail object in order to be pushed into mail_items
    @mail_items << mail if mail.class <= MailItem
  end

  def open_mail
    @mail_items.shift if !mail_items.nil?
  end

  def count_type(mail_type)
    count = 0
    mail_items.each do |x|
      count = count + 1 if x.class.name == mail_type
    end
    count
  end

  def to_s
    "The mailbox has #{count_type("PostCard")} postcards and #{count_type("Package")} packages"
  end

end