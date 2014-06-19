class User
  def initialize(options = {})
    @gender = options[:gender]
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @age = options[:age]
    @is_married = options[:is_married]
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

  def is_married?
    @is_married
  end

  def abilities
    @abilities = []
    @abilities << :drive if @age >= 16
    @abilities << :vote if @age >= 18
    @abilities << :rent_car if @age >=25
    @abilities << :president if @age >=35
    @abilities
  end

  def formal_name
    if @gender == "female"
      if @age >= 20
        if @is_married == true
          @formal_name = "Mrs. #{@last_name}"
        elsif @is_married == false
          @formal_name = "Ms. #{@last_name}"
        end
      elsif @age < 20
        if @is_married == false
          @formal_name = "#{@first_name} #{@last_name}"
        end
      end
    elsif @gender == "male"
      if @age >= 20
        @formal_name = "Mr. #{@last_name}"
      elsif @age < 20
        @formal_name = "#{@first_name} #{@last_name}"
      end
    end
  end
end
