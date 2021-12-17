require 'algorithms'
require 'set'
include Containers

def get_map_entry(map, node)
  x, y = node
  max_x, max_y = map.size, map[0].size
  (map[x % max_y][y % max_x] + x/max_x + y/max_x - 1) % 9 + 1
end

def get_neighbours(map, node, rows, cols)
  x, y = node
  [[-1, 0], [0, 1], [1, 0], [0, -1]]
    .map{|dx, dy| [x + dx, y + dy]}
    .filter{|x, y| x.between?(0, rows-1) && y.between?(0, cols-1)}
end



def shortest_path(map, map_repeat=1, start=[0, 0], goal=[-1,-1])

  rows, cols = map_repeat*map.size, map_repeat*map[0].size
  goal = [goal[0] % rows, goal[1] % cols]

  distance = {}
  queue = MinHeap.new
  #done = {}

  rows.times{|x| cols.times{|y| distance[[x, y]] = 1/0.0}}

  distance[[0, 0]] = 0
  #done = Set.new()
  queue.push(0, start)

  while node = queue.pop

    #break if node == goal
    #next if done.member?(node)
    #done.add(node)

    get_neighbours(map, node, rows, cols).each do |neigh|

      new_dist = distance[node] + get_map_entry(map, neigh)

      next if new_dist >= distance[neigh]# || done.include?(n)

      distance[neigh] = new_dist
      queue.push(new_dist, neigh)
    end
  end

  return distance[goal]
end


map = ARGF.each_line.map{|l| l.strip.chars.map(&:to_i)}

puts "Part 1: #{shortest_path(map)}"
puts "Part 2: #{shortest_path(map, 5)}"

