require 'matrix'
require 'set'

$grid = Matrix.rows(ARGF.readlines.map{ |l| l.strip.chars.map(&:to_i) })
$dims = $grid.column_count
$dirs = [-1, 0, 1].product([-1, 0, 1]).filter{|x,y| x != 0 || y != 0}

def step()
  $grid += Matrix.build($dims){ 1 }
  flashed = Set[]

  loop do
    changes = Matrix.zero($dims)

    $grid.each_with_index
      .filter{ |e, x, y| e > 9 && !flashed.member?([x, y])}
      .each do |elem, row, col|

      flashed.add([row, col])

      $dirs
        .map{ |dx, dy| [row + dx, col + dy] }
        .filter{ |x, y| x.between?(0, $dims - 1) && y.between?(0, $dims - 1) }
        .each{ |x, y| changes[x, y] += 1 }

    end

    break if changes.zero?

    $grid += changes
  end

  flashed.each{ |x, y| $grid[x, y] = 0 }
  return flashed.size
end

p 100.times.map{ step() }.sum

count = 100
while $grid.each.uniq.size > 1
  count += 1
  step()
end

p count
