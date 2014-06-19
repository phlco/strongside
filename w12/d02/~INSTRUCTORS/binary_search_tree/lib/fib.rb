# 0, 1, 2, 3, 4, 5
# 1, 1, 2, 3, 5, 8

require 'debugger'

def fib(x)

  debugger

  if x == 1
    return 1

  elsif x == 2
    return 1

  else
    return fib(x-1) + fib(x-2)

  end
end


fib(5)
# (1..5).each do |i|
#   puts fib(i)
# end
