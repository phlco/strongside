class User
  attr_accessor :gender, :first_name, :last_name, :age, :married

  def abilities(age)

    if age >= 35
      [:drive, :vote, :rent_car, :president]
    elsif age >= 25
      [:drive, :vote, :rent_car]
    elsif age >= 18
      [:drive, :vote]
    elsif age >= 16
      [:drive]
    end

  end

  def formal_name
    if @gender == 'male'
      if @age >= 20
        "Mr. #{@first_name} #{@last_name}"
      else
        "#{@first_name} #{@last_name}"
      end
    elsif @gender == 'female'
      if @age >= 20
        if @married == true
          return  "Mrs. #{@first_name} #{@last_name}"
        else
          "Ms. #{@first_name} #{@last_name}"
        end
      else
        "#{@first_name} #{@last_name}"
      end
    end
  end

end