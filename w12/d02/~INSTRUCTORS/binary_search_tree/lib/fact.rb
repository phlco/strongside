require 'debugger'

def fact(x)
  debugger

  # Base Case
  if x == 1
    return 1

  else
    return x * fact(x-1)

  end

end

puts fact(3)

# 3!
# 3 * 2!
#     2 * 1!
