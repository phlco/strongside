class Postcard < Mailitem
  def message
    "I am a message"
  end

  def return_message
    true
  end
end
