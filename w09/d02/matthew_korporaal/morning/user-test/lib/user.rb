require 'pry'

class User
  attr_accessor :gender, :first_name, :last_name, :age, :married

  def initialize(options = {})
    @gender = options[:gender]
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @age = options[:age]
    @married = options[:married]
  end

  def married?
    @married
  end

  def abilities
    abilities = []
    abilities << :drive if age >= 16
    abilities << :vote if age >= 18
    abilities << :rent_car if age >= 25
    abilities << :president if age >= 35
    return abilities
  end

  def formal_name
    if age >= 20
      if @gender == 'f'
        prefix = self.married? ? "Mrs." : "Ms."
      else
        prefix = "Mr."
      end

      return "#{prefix} " + self.name

    elsif age < 20
      return self.name

    end

  end

  def name
    "#{first_name} #{last_name}"
  end

end