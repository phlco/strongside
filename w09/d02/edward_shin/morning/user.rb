class User

  def initialize(option={})
    @gender = option[:gender]
    @first_name = option[:first_name]
    @last_name = option[:last_name]
    @age = option[:age]
    @married = option[:married]
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
    @abilities.push(:drive) if @age > 15
    @abilities.push(:vote) if @age > 17
    @abilities.push(:rent_car) if @age > 24
    @abilities.push(:president) if @age > 34
    return abilities
  end


  # def formal_name
  #   if @gender == "female" && (@married == true && @age >= 20)
  #     "Mrs. #{first_name} #{last_name}"
  #   elsif @gender == "female" && @age < 20
  #     "#{first_name} #{last_name}"
  #   elsif @gender == "female" && @age >= 20
  #     "Ms. #{first_name} #{last_name}"
  #   end
  # end

  def formal_name
    name = "#{first_name} #{last_name}"
    #regardless of age, no prefix to name
    if @age < 20
      @formal_name = "#{name}"
    # female
  else
    if @gender == 'female'
      if @married == false
        @formal_name = "Ms. #{name}"
      else
        @formal_name = "Mrs. #{name}"
      end
    # male
  else
    @formal_name = "Mr. #{name}"
  end
end
end









end