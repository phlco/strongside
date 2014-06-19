require_relative 'postcard'
require_relative 'package'

class Mailbox

  def initialize
    @check_mail = []
  end

  def check_mail
    @check_mail
  end

  def accept_mail(mail)
    @check_mail << mail
  end
  def open_mail
    return @check_mail.shift
  end

  def to_s
    packages = 0
    postcards = 0
    @check_mail.each do |mail|
      if mail.class == Package
        packages += 1
      elsif mail.class == Postcard
        postcards += 1
      end
    end
    return "the mailbox has #{packages} packages and #{postcards} postcards"
  end

end