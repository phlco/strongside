class User
  attr_accessor :gender, :first_name, :last_name, :age

  def initialize(options = {})
    @gender = options[:gender]
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @age = options[:age]
    @married = false
    @abilities = []
  end

  def married?
    @married
  end

  def get_married
    @married = true
  end

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
        if married?
          "Mrs. #{@last_name}"
        else
          "Ms. #{@last_name}"
        end
      else
        "#{@first_name} #{@last_name}"
      end
    else
      if @age >= 20
        "Mr. #{@last_name}"
      else
        "#{@first_name} #{@last_name}"
      end
    end
  end

end
