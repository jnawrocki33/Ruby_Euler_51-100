include Math
require 'byebug'
def isPrime(int, table)
  if table[int]
    return table[int] == "true" ? true : false
  end

  (2..sqrt(int).to_i).each do |divisor|
    if int%divisor == 0
      table[int] = "false"
      return false
    end
  end
  table[int] = "true"
  return true
end


def do_concat(p1, p2, table)
  s1 = p1.to_s
  s2 = p2.to_s
  return false unless isPrime((s1 + s2).to_i, table) and isPrime((s2 + s1).to_i, table)
  return true
end

def do_all_concat(p1, p2, p3, p4, p5, hash, table)
  return false if p1 + p2 + p3 + p4 + p5 < 792
  s1 = p1.to_s
  s2 = p2.to_s
  s3 = p3.to_s
  s4 = p4.to_s
  s5 = p5.to_s
  #s1:
  unless isPrime((s1 + s2).to_i, table) and isPrime((s2 + s1).to_i, table)
    # hash[p1] = (hash[p1] ? hash[p1] + [p2] : [p2])
    # hash[p2] = (hash[p2] ? hash[p2] + [p1] : [p1])
    return false
  end
  unless isPrime((s1 + s3).to_i, table) and isPrime((s3 + s1).to_i, table)
    # hash[p1] = (hash[p1] ? hash[p1] + [p3] : [p3])
    # hash[p3] = (hash[p3] ? hash[p3] + [p1] : [p1])
    return false
  end
  unless isPrime((s1 + s4).to_i, table) and isPrime((s4 + s1).to_i, table)
    # hash[p1] = (hash[p1] ? hash[p1] + [p4] : [p4])
    # hash[p4] = (hash[p4] ? hash[p4] + [p1] : [p1])
    return false
  end
  unless isPrime((s1 + s5).to_i, table) and isPrime((s5 + s1).to_i, table)
    # hash[p1] = (hash[p1] ? hash[p1] + [p5] : [p5])
    # hash[p5] = (hash[p5] ? hash[p5] + [p1] : [p1])
    return false
  end

  #s2:
  unless isPrime((s2 + s3).to_i, table) and isPrime((s3 + s2).to_i, table)
    # hash[p2] = (hash[p2] ? hash[p2] + [p3] : [p3])
    # hash[p3] = (hash[p3] ? hash[p3] + [p2] : [p2])
    return false
  end
  unless isPrime((s2 + s4).to_i, table) and isPrime((s4 + s2).to_i, table)
    # hash[p2] = (hash[p2] ? hash[p2] + [p4] : [p4])
    # hash[p4] = (hash[p4] ? hash[p4] + [p2] : [p2])
    return false
  end
  unless isPrime((s2 + s5).to_i, table) and isPrime((s5 + s2).to_i, table)
    # hash[p2] = (hash[p2] ? hash[p2] + [p5] : [p5])
    # hash[p5] = (hash[p5] ? hash[p5] + [p2] : [p2])
    return false
  end

  #s3
  unless isPrime((s3 + s4).to_i, table) and isPrime((s4 + s3).to_i, table)
    # hash[p3] = (hash[p3] ? hash[p3] + [p4] : [p4])
    # hash[p4] = (hash[p4] ? hash[p4] + [p3] : [p3])
    return false
  end
  unless isPrime((s3 + s5).to_i, table) and isPrime((s5 + s3).to_i, table)
    # hash[p3] = (hash[p3] ? hash[p3] + [p5] : [p5])
    # hash[p5] = (hash[p5] ? hash[p5] + [p3] : [p3])
    return false
  end

  #s4
  unless isPrime((s4 + s5).to_i, table) and isPrime((s5 + s4).to_i, table)
    # hash[p4] = (hash[p4] ? hash[p4] + [p5] : [p5])
    # hash[p5] = (hash[p5] ? hash[p5] + [p4] : [p4])
    return false
  end


  return true
end



answers = []
table = []

LIMIT = 10000
(3..LIMIT).each do |p1|
  next unless isPrime(p1, table)
  puts p1

  (p1 + 1..LIMIT).each do |p2|

    next unless isPrime(p2, table)
    next unless do_concat(p1, p2, table)

    (p2 + 1..LIMIT).each do |p3|

      next unless isPrime(p3, table)
      next unless do_concat(p1, p3, table)
      next unless do_concat(p2, p3, table)

      (p3 + 1..LIMIT).each do |p4|

        next unless isPrime(p4, table)
        next unless do_concat(p4, p2, table)
        next unless do_concat(p1, p4, table)
        next unless do_concat(p4, p3, table)

        (p4 + 1..LIMIT).each do |p5|

          next unless isPrime(p5, table)
          next unless do_concat(p1, p5, table)
          next unless do_concat(p2, p5, table)
          next unless do_concat(p3, p5, table)
          next unless do_concat(p4, p5, table)

          print [p1, p2, p3, p4, p5], "\n"

        end
      end

    end
  end


end



puts answers