SIZE = 1000
grid = Array.new(SIZE) { Array.new(SIZE, 0) }

File.open(ARGV[0]).each do |line|
  start, finish = line.strip.split(" -> ").map {|x| x.split(",").map(&:to_i)}.sort

  if start[0] == finish[0]
    (start[1]..finish[1]).each {|y| grid[start[0]][y] += 1}
  elsif start[1] == finish[1]
    (start[0]..finish[0]).each {|x| grid[x][start[1]] += 1}
  elsif start[1] < finish[1]
    (0..finish[0]-start[0]).each {|delta| grid[start[0] + delta][start[1] + delta] += 1}
  else
    (0..finish[0]-start[0]).each {|delta| grid[start[0] + delta][start[1] - delta] += 1}
  end
end

p grid.flatten.count{|x| x > 1}

