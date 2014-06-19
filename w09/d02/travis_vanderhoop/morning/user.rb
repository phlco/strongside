class User
  attr_reader :gender, :first_name, :last_name, :age, :married

  def initialize(gender, first_name, last_name, age, married)
     @gender = gender
     @first_name = first_name
     @last_name = last_name
     @age = age
     @married = married
     @abilities = []
     @formal_name = @first_name + " " + @last_name
  end

  def abilities
    case @age
    when 16...18
      @abilities = [:drive]
    when 18...25
      @abilities = [:drive, :vote]
    when 25...35
      @abilities = [:drive, :vote, :rent_car]
    when 35..133
      @abilities = [:drive, :vote, :rent_car, :president]
    else
      @abilities
    end
  end

  def formal_name
    if @gender == "Male" && @age >= 20
      @formal_name = "Mr. " + @formal_name
    else
      if @age >= 20
        if @married
          @formal_name = "Mrs. " + @formal_name
        else
          @formal_name = "Ms. " + @formal_name
        end
      end
    end
    @formal_name
  end #formal_name
end # User
