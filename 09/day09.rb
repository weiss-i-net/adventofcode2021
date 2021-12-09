grid = ARGF.readlines.map{|x| x.chars.map(&:to_i)}

p grid
lowpoints = {}
grid.each_with_index do |row, x|
  row.each_with_index do |cell, y|
    nextp = [x, y]
    while nextp
      p nextp
      lastp = nextp.clone
      nextp = [[1, 0], [0, 1], [-1, 0], [0, -1]]
        .map{|dx, dy| [x+dx, y+dy]}
        .filter{|x, y| !grid[x][y].nil?}
        .filter{|nx, ny| grid[nx][ny] < grid[x][y]}.first
    end
    p lastp
    lowpoints[lastp] = grid[lastp[0]][lastp[1]]

  end
end


p lowpoints
