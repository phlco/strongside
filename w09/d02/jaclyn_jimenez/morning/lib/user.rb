class User
  attr_accessor :first_name, :last_name,  :gender, :age, :marital_status

  def initialize(person)
    @first_name = person[:first_name]
    @last_name = person[:last_name]
    @gender = person[:gender]
    @age = person[:age]
    @marital_status = person[:marital_status]
  end

  def abilities
    abilities = []
    abilities << :drive if @age > 16
    abilities << :vote if @age > 18
    abilities << :rent_car if @age > 25
    abilities << :president if @age > 35
    return abilities
  end

  def formal_name
    title = ""
    full_name = "#{@first_name} #{last_name}"
    if @age >= 20
      if @gender == "female"
        @marital_status == "married" ? title = "Mrs." : title = "Ms."
      elsif @gender == "male"
        title = "Mr."
      end
    end
    "#{title} #{full_name}"
  end

end
