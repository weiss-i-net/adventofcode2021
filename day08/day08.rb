lines = ARGF.readlines.map{|l| l.split(" | ").map{|s| s.split(" ").map(&:chars)}}

# digits: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
# uniq:      2,       4,       3, 7
# rest:   6,    5, 5,    5, 6,       6

uniq = [2, 4, 3, 7]

puts "Part 1: #{lines.map{|x| x[1]}.flatten(1).count{|x| uniq.include? x.size}}"

lines.each do |l|
  t = {}

  tal = l[0].flatten.tally
  t["b"] = tal.key(6)
  t["e"] = tal.key(4)
  t["f"] = tal.key(9)

  one   = l[0].filter{|x| x.size == 2}.first
  four  = l[0].filter{|x| x.size == 4}.first
  seven = l[0].filter{|x| x.size == 3}.first
  eight = l[0].filter{|x| x.size == 7}.first

  # a == 7/1
  t["a"] = seven.difference(one).first

  # c == 1/{f}
  t["c"] = one.difference([t["f"]]).first

  # d = 4/{b,c,f}
  t["d"] = four.difference(t.fetch_values("b", "c", "f")).first

  # g = 8/{a, b, c, d, e, f}
  t["g"] = eight.difference(t.fetch_values(*"a".."f")).first

  l[1].map!{|x| t.invert.fetch_values(*x).sort}
end

digits = { "abcefg" => "0", "cf" => "1", "acdeg" => "2", "acdfg" => "3", "bcdf" => "4",
           "abdfg" => "5", "abdefg" => "6","acf" => "7","abcdefg" => "8","abcdfg" => "9" }

puts "Part 2: #{lines.map{ |l| l[1].map{|x| digits[x.join]}.join.to_i }.sum}"
