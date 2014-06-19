class Lamp

  def initialize
    @bulb = true
    @plug_in = false
  end

  def bulb
    @bulb
  end

  def plug_in
    @plug_in == false ? @plug_in = true : "Lamp is already plugged in"
  end

  def unplug
    @plug_in == true ? @plug_in = false : "Lamp is already unplugged"
  end

end
