class User
  attr_accessor :gender, :first_name, :last_name, :age, :married, :abilities

  def initialize(options = {})
    @gender = options[:gender]
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @age = options[:age]
    @married = options[:married]
    @abilities = []
  end

  # method 'abilities' that returns an array of symbols represending things that you can do in this file
  def abilities
    @abilities << :drive if @age >= 16
    @abilities << :vote if @age >= 18
    @abilities << :rent_car if @age >= 25
    @abilities << :president if @age >= 35
    @abilities
  end

  def formal_name
    if @gender == "female"
      if @age >= 20
        return "Mrs. #{@first_name} #{@last_name}" if @married == true
        return "Ms. #{@first_name} #{@last_name}" if @married == false
      else
        return "#{@first_name} #{@last_name}"
      end
    elsif @gender == "male"
      return "Mr. #{@first_name} #{@last_name}" if @age >= 20
      return "#{@first_name} #{@last_name}" if @age < 20
    end
  end

end