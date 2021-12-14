require 'set'

g = Hash.new{|h, k| h[k] = []}

ARGF.readlines.each do |l|
  from, to = l.strip.split('-')
  g[from] << to
  g[to] << from
end

Path = Struct.new(:path, :twice?)


def getPaths(g, t)
  q = [ Path.new([ 'start' ], t) ]
  paths = 0

  while q.any? do
    c = q.pop
    g[c.path.last].filter{ |v| v == v.upcase || !c.twice? || !c.path.include?(v) }.each do |v|
      next if v == 'start'

      if v == 'end'
        paths += 1
        next
      end

      if v == v.downcase
        q << Path.new(c.path.clone.push(v), c.twice? || c.path.include?(v))
      else
        q << Path.new(c.path.clone.push(v), c.twice?)
      end
    end
  end

  paths
end



puts "Part 1: #{getPaths(g, true)}"
puts "Part 2: #{getPaths(g, false)}"
