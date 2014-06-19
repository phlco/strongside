def ask(question)
  puts(question)
  answer = gets.chomp
end

TRAIN_LINES = {
  "n" => "Times Square, 34th, 28th, 23rd, Union Square, 8th".split(", "),
  "l" => "8th, 6th, Union Square, 3rd, 1st".split(", "),
  "6" => "Grand Central, 33rd, 28th, 23rd, Union Square, Astor Place".split(", ")
}

UNION_SQUARE = "Union Square"

def calc_distance_on_line(line, start_station, end_station)
  station = TRAIN_LINES[line]
  start_index = station.find_index(start_station)
  end_index = station.find_index(end_station)
  answer = end_index - start_index
  return answer.abs # abs returns the absolute value of num.
end

start_line = ask("What line are you getting at?")
start_station = ask("At which station?")

end_line = ask("What line are you getting off")
end_station = ask("At which station?")

if start_line == end_line
  calc_distance_on_line(line, start_station, end_station)
else
calc_distance_before_transfer = calc_distance_on_line(start_line, start_station, UNION_SQUARE)
calc_distance_after_transfer = calc_distance_on_line(end_line, UNION_SQUARE, end_station)
answer2 = calc_distance_before_transfer + calc_distance_after_transfer
end

p answer2
