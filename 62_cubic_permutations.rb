require 'byebug'
include Math


def int_to_array(num)
    str = num.to_s
    a = []
    (0..str.length - 1).each {|index| a.push(str[index].to_i)}
    return a
end

# cubes is a hash, key -> value
#    key: sorted cube number
#    value: array: [amount of cubes sorted down to this number, [the cube numbers sorted down to key]]
# when value[0] == 5,value[1] contains the cubes which are permutations of eachother

def find_value()
    cubes = {}
    (1..10000).each do |number|
        cube = number * number * number
        x = int_to_array(cube).sort.join
        cubes[x] = (cubes[x] ? [cubes[x][0] + 1, cubes[x][1] + [cube]] : [1, [cube]])
        return cubes[x][1][0] if cubes[x][0] == 5
    end
end

puts find_value()


    

    