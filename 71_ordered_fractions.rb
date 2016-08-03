

def f()
    
    num = 428571
    den = 1000000
    max = 0
    max_num = 428571
        
    (0..10000).each do |factor_2|
        
        puts factor_2
        flag = false
        (0..10000).each do |factor_1|
            
            
            break if flag == true
            
            test_fraction = (num - factor_1) / (den.to_f - factor_2)
            
            flag = true if test_fraction > max
            if test_fraction < 3/7.to_f and test_fraction > max
                puts num - factor_1
                max_num = num - factor_1
                max = test_fraction
            end
            
        end
    end
    puts max_num
end
f()