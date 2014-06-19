class PostCard < MailItem

  def set_message(message)
    @message = message
  end

  def get_message
    @message
  end

end
