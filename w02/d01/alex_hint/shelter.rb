# Shelter:
# The shelter should display all the persons.
# The shelter should display all the animals.

class Shelter
  attr_accessor :person, :animal, :shelter_hash, :people, :animals
    def initialize   #WHY DON'T I NEED PEOPLE AND ANIMALS AS INPUTS?!
      #@shelter_hash = {} #Hash.new { |people, person| people[person] = [] }
      @people = {}
      @animals = {}
    end

    def do_something

    end
end


# shelter_hash = {}

# shelter_hash = {

#   :people => {
#     :p1 =>

#     :p2 =>

#    }

#   :animals => {
#     :a1 =>

#     :a2 =>

#   }
# }