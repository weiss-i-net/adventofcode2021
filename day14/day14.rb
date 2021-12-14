input = ARGF.each_line.map(&:strip).to_a

pairs = Hash.new(0)
input[0].chars.each_cons(2){|a,b| pairs[[a, b]] += 1}
rules = input[2..].map{_1.split(' -> ').map(&:chars).flatten}

40.times do
  new_pairs = pairs.clone
  rules.each do |a, b, n|
    new_pairs[[a, n]] += pairs[[a, b]]
    new_pairs[[n, b]] += pairs[[a, b]]
    new_pairs[[a, b]] -= pairs[[a, b]]
  end
  pairs = new_pairs
end

count = Hash.new(0)
count[input[0][-1]] = 1
pairs.each{|k, v| count[k[0]] += v}

puts count.values.minmax.reduce(&:-).abs
