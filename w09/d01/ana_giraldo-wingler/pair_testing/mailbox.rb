require_relative 'mail_item'

class Mailbox < MailItem
  attr_accessor :mail_items

  def initialize
    @mail_items = []
  end

  def accept_mail(mail)
    # 'mail' must be a mail object in order to be pushed into mail_items
    @mail_items << mail if mail.class < MailItem
  end

  def open_mail
    @mail_items.shift
  end

  def to_s
    num_postcards = 0
    num_packages = 0

    @mail_items.each do |item|
      if item.class == PostCard
        num_postcards += 1
      else
        num_packages += 1
      end
    end

  return "The mailbox has #{num_postcards} postcards and #{num_packages} packages."
  end

end