count = 0

flag = false
(1..10000).each do |power|
    
    (1..9).each do |base|
        
        
        count += 1 if (base ** power).to_s.length == power
        flag = true if base == 9 and (base ** power).to_s.length != power
    end
    break if flag
end

puts count