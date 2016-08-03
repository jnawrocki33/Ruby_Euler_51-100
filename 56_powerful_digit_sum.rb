
def digit_sum(int)
  str = int.to_s
  sum = 0
  (0..str.size - 1).each do |index|
    sum += str[index].to_i
  end
  return sum
end

max = 0

(1..100).each do |a|
  (1..100).each do |b|
    temp = digit_sum(a ** b)
    max = temp if temp > max

  end
end

puts max