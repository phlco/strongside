require_relative "package"
require_relative "postcard"

class Mailbox
  attr_accessor :objects
  def initialize
    @objects = []
  end
  def accept_mail(obj)
    @objects << obj
  end
  def open_mail
    @objects.pop
  end
  def to_s
    packs = 0
    posts = 0
    @objects.each do |mail|
      if mail.is_a?(Package)
        packs += 1
      elsif mail.is_a?(Postcard)
        posts += 1
      end
    end
    "The mailbox has #{posts} postcards and #{packs} packages"
  end
end
