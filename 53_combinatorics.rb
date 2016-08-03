class Integer

  def factorial
    f = 1
    self.downto(1).each {|x| f *= x}
    return f
  end
end


def nCr(n,r)
  return n.factorial / (  (r.factorial) * ((n-r).factorial))
end

#
#
# (1..11).each do |n|
#   (0..n).each do |r|
#     print nCr(n,r), " " #" n = #{n}, r = #{r} \n"
#   end
#   print "\n"
# end

count = 0

(23..100).each do |n|
  puts n
  (0..n).each do |r|
    puts r

    if nCr(n,r) > 1000000
      range = (n - r) - r
      count += range + 1
      next
    end




  end
end

puts count