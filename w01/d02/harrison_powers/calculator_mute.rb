class String
  def calculate
    [:+, :-, :*, :/, :**].each do |op|
      factors = self.split(op.to_s)
      return factors.map(&:calculate).inject(op) if factors.size > 1
    end
    to_f # No calculation needed
  end
  alias calc calculate
end

include Math

entry = "0"

while entry != "q"
	puts "welcome to the ruby calculator"
	puts
	puts "press 1 to see a menu of advanced calculations"
	puts "press 2 to skip ahead to the basic calculator"
	puts "press q to quit"
	puts
	entry = gets.chomp
	if entry == "1"
		puts
		puts
		puts "I will allow you to square a number or take the square root."
		puts
		puts "Which would you prefer?"
		puts
		puts "1 - Square"
		puts "2 - Square Root"
		entry = gets.chomp
		if entry == "1"
			puts
			puts "What number would you like to square?"
			puts
			entry = gets.chomp
			puts entry.to_i ** 2
		elsif entry == "2"
			puts
			puts "What number would you like to take the square root of?"
			puts
			entry = gets.chomp
			puts sqrt(entry.to_i)
		else
			puts "I hope next time you have something for me to do."
		end
	elsif entry == "2"
		puts
		puts
		puts "what would you like to calculate?"
		puts
		entry = gets.chomp
		puts entry.calculate
	elsif entry == "q"
		puts
		puts "peace homie"
	end
	puts
	puts
end
