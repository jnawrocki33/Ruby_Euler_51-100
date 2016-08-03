
include Math
require 'byebug'
def is_prime(int)

  (2..sqrt(int).to_i).each do |divisor|
    if int%divisor == 0
      return false
    end
  end
  true
end


s = 1
diagonals = [1]
size = 1
num_primes = 0
prev_1 = 1
prev_2 = 1
prev_3 = 1
prev_4 = 1


while true
  prev_1 = prev_1 + 4*s - 2
  prev_2 = prev_2 + 4*s
  prev_3 = prev_3 + 4*s + 2
  prev_4 = prev_4 + 4*s +4
  diagonals.push(prev_1)
  diagonals.push(prev_2)
  diagonals.push(prev_3)
  diagonals.push(prev_4)

  count = 0

  diagonals[-4..-1].each do |x|
    count += 1 if is_prime(x)
  end
  num_primes += count
  size += 4

  current_percent = num_primes / size.to_f
  if current_percent < 0.2
    puts current_percent
  end

  if current_percent < 0.1
    puts "here: \n"
    puts current_percent
    puts s + 2
    break
  end

  s += 2
end
