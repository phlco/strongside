require 'debugger'


def recursive_function
  # debugger
  puts "OMG!"
  recursive_function
end

def sum(x)

  debugger

  if x == 0
    return 0

  else
    return x + sum(x-1)

  end

end


