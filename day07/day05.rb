nums = ARGF.read.split(",").map(&:to_i).sort()
median = nums[nums.size / 2]
mean = nums.sum / nums.size

puts "Part 1: #{nums.map {|i| (mean - i).abs}.sum}"
puts "Part 2: #{nums.map {|i| d = (mean - i).abs; d*(d+1)/2}.sum}"
