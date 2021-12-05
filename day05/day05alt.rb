pairs = []
grid = {}

File.open(ARGV[0]).each do |line|
  p1, p2 = line.strip.split(" -> ")
  x1, y1 = p1.split(",").map(&:to_i)
  x2, y2 = p2.split(",").map(&:to_i)

  dx = x2-x1
  dy = y2-y1

  steps = [dx, dy].map(&:abs).max + 1

  x, y = x1, y1
  steps.times do |step|
    if grid.key?([x, y])
      grid[[x, y]] += 1
    else
      grid[[x, y]] = 1
    end

    x += (dx <=> 0)
    y += (dy <=> 0)
  end
end

p grid.values.count{|x| x > 1}

