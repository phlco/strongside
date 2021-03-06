quit = false
while quit != true
  puts " "
  puts "What would you like to do?"
  print "(add, subtract, multiply, divide, raise to a power, square root, quit) "
  func = gets.chomp!

  until func == "add" || func == "subtract" || func == "multiply" || func == "divide" || func == "raise to a power" || func == "square root" || func == "quit"
    puts "I'm sorry, try again"
    print "add, subtract, multiply, divide, raise to a power, square root, quit) "
    func = gets.chomp!
  end

  if func == "quit" then
    quit = true
    break
  else puts "What numbers would you like to #{func}?"
  end

  case func
  when "add" then
    print "for x+y, type x y "
  when "subtract" then
    print "for x-y, type x y "
  when "multiply" then
    print "for x*y, type x y "
  when "divide" then
    print  "for x/y, type x y "
  when "raise to a power" then
    print "for x^y, type x y "
  when "square root" then
    print "for root x, type x "
  end

  nums = gets.chomp!.split
  x = nums [0]
  y = nums [1]
  x_i = x.to_i
  x_f = x.to_f
  y_i = y.to_i
  y_f = y.to_f

  until (x_i.to_s == x || x.to_s == x || x == "quit") && (y_i.to_s == y || y_f.to_s == y || y == nil)
    puts "I'm sorry, try again. I need numbers"
    print "(x y) "
    nums = gets.chomp!.split
    x = nums[0]
    y = nums[1]
  end

  if x == "quit" then
    quit = true
    break
  end

  case func
  when "square root" then
    puts "finding the square root of #{x}"
  when "raise to a power"
    puts "raising #{x} to the #{y} power"
  else
   puts "#{func.delete("e")}ing #{x} and #{y}"
  end

  case func
  when "add" then
    puts "#{x} + #{y} = #{x_f + y_f}"
  when "subtract" then
    puts "#{x} - #{y} = #{x_f - y_f}"
  when "multiply" then
    puts "#{x} * #{y} = #{x_f * y_f}"
  when "divide" then
    puts "#{x} / #{y} = #{x_f / y_f}"
  when "raise to a power"
    puts "#{x}^#{y} = #{x_f ** y_f}"
  when "square root"
    puts "the square root of #{x} is #{Math.sqrt(x_f)}"
  end
end