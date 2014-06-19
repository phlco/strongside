class User
attr_accessor :gender, :first_name, :last_name, :age, :abilities, :formal_name
  def initialize(options)
    @gender = options[:gender]
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @age = options[:age]
    @is_married = false
    @formal_name = @first_name + " " + @last_name
  end

  def is_married?
    @is_married
  end

  def is_married= input
    @is_married = input
  end

  def abilities
    abilities = []
    abilities << :drive if age >= 16
    abilities << :vote if age >= 18
    abilities << :rent if age >= 25
    abilities << :president if age >= 35
    return abilities
  end

  def formal_name
    if @age <= 20
      @formal_name
    else
      if @gender == "female"
        prefix = @is_married? "Mrs." : "Ms."
      else @gender == "male"
        prefix = "Mr."
      end
      @formal_name = prefix + " " + @formal_name
    end
    @formal_name
  end
end
