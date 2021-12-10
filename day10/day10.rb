lines = ARGF.readlines.map(&:strip)


error_score = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25137
}

error_score2 = {
  '(' => 1,
  '[' => 2,
  '{' => 3,
  '<' => 4
}

other = {
  '(' => ')',
  '[' => ']',
  '{' => '}',
  '<' => '>'
}

score = 0
score_arr = []

lines.each do |l|
  stack = []
  err = false

  l.chars.each do |chr|
    err = false
    if ['{', '[', '(', '<'].include?(chr)
      stack.push(chr)
    else
      if other[stack.pop] != chr
        score += error_score[chr]
        err = true
        break
      end
    end
  end


  if !err
    score2 = 0
    stack.reverse_each do |chr|
      score2 *= 5
      score2 += error_score2[chr]
    end
    score_arr.append(score2)
  end
end


puts score
puts score_arr.sort[score_arr.size / 2]
