class User

  attr_accessor :gender, :first_name, :last_name, :age

  def initialize(options = {})
    @gender = options[:gender]
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @age = options[:age]
    @married = options[:married]
  end

  def married?
    @married
  end

  def abilities
    if @age >= 16 && @age < 18
      @abilities = [:drive]
    elsif @age >= 18 && @age < 25
      @abilities = [:drive, :vote]
    elsif @age >= 25 && @age < 35
      @abilities = [:drive, :vote, :rent_car]
    elsif @age >= 35
      @abilities = [:drive, :vote, :rent_car, :president]
    end
  end

  def formal_name
    name = "#{@first_name} #{@last_name}"
    if @age < 20
      name
    else
      @gender == "male" ? "Mr. #{name}" : married? ? "Mrs. #{name}" : "Ms. #{name}"
    end
  end

end
