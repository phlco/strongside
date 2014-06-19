class User

  attr_reader :gender, :first_name, :last_name
  attr_accessor :age, :married

  def initialize(options = {})
    @gender = options[:gender]
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @married = options[:married]
    @abilities = [:drive, :vote, :rent_car, :president]
  end

  def married?
    @married
  end

  def abilities
    if @age <= 16
      [@abilities.slice(0)]
    elsif @age <= 18
      @abilities.slice(0..1)
    elsif @age <= 25
      @abilities.slice(0..2)
    elsif @age <= 45
      @abilities
    end
  end

  def formal_name
    full_name = self.first_name + " " + self.last_name
    if self.gender == 'f'
      if married?
        "Mrs. " + full_name
      elsif self.age >= 20
        "Ms. " + full_name
      else
        full_name
      end
    else
      if self.age >= 20
        "Mr. " + full_name
      else
        full_name
      end
    end

  end



end
