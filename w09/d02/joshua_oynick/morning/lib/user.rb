class User

  def initialize(options = {})
    @gender = options[:gender]
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @age = options[:age]
    @married = options[:married]
    @abilities = []
  end

  def gender
    @gender
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def age
    @age
  end

  def married?
    @married
  end

  def abilities

    @abilities << :drive if @age >= 16
    @abilities << :vote if @age >= 18
    @abilities << :rent_car if @age >= 25
    @abilities << :president if @age >= 35

    return @abilities
  end

  def formal_name
    if @gender = 'female' && @age >= 20 && @married == true
      return "Mrs. " + @first_name + " " + @last_name
    end

    if @gender = 'female' && @age >= 20 && @married == false
      return "Ms. " + @first_name + " " + @last_name
    end

    if @age < 20
      return @first_name + " " + @last_name
    end

    if @gender = 'male' && @age >=20
      return "Mr. " + @first_name + " " + @last_name
    end
  end


end
