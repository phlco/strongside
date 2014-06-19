def seq(x)
  if x == 1
    return 1

  else
    return seq(x-1) + 1

  end
end

puts seq(4)
