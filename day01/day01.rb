lines = ARGF.each_line.map(&:to_i)
puts "Part 1: #{lines.each_cons(2).count{_1 < _2}}"
puts "Part 2: #{lines.each_cons(4).count{_1 < _4}}"
