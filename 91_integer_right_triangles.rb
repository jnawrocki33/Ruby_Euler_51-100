include Math
require 'byebug'

def getMax(s1, s2, s3)
  if s1 > s2

    if s1 > s3
      max = s1
    else
      max = s3
    end
    return max
  else
    if s2 > s3
      max = s2
    else
      max = s3
    end
    return max
  end
end


def isRight(s1, s2, s3)

  return false if s1 == 0 or s2 == 0 or s3 == 0
  hypotenuse  = getMax(s1, s2, s3)

  array = [s1, s2, s3]
  array.delete_at(array.index(hypotenuse))
  hypotenuse == array[0] + array[1] ? true : false

end


hash = {}

LIMIT = 50
count = 0
(0..LIMIT).each do |x1|
  (0..LIMIT).each do |y1|

    (0..LIMIT).each do |x2|
      (0..LIMIT).each do |y2|

        puts x1

        next if x1 == 0 and x2 == 0 and y1 == 0 and y2 == 0

        s1 = x1**2 + y1**2
        s2 = x2**2 + y2**2
        s3 = (x2-x1)**2 + (y2-y1)**2


        #puts "!!!!!!!!!!!!!"  if hash["#{s1},#{s2},#{s3}"] == "done"

        if hash["#{x1},#{y1},#{x2},#{y2}"]!= nil

          if hash["#{x1},#{y1},#{x2},#{y2}"] == "yes"
            count += 1
            print s1, ' ', s2, ' ', s3, "[(#{x1},#{y1}),(#{x2},#{y2})]\n"
            hash["#{x1},#{y1},#{x2},#{y2}"] = "done"
            hash["#{x2},#{y2},#{x1},#{y1}"] = "done"
          end

          next

        end



        if isRight(s1, s2, s3)

          print s1, ' ', s2, ' ', s3,"[(#{x1},#{y1}),(#{x2},#{y2})]\n"
          count += 1
          scale = 2

          hash["#{x1},#{y1},#{x2},#{y2}"] = "done"
          hash["#{x2},#{y2},#{x1},#{y1}"] = "done"
          while scale * x1 <= LIMIT and scale * x2 <= LIMIT and scale * y1 <= LIMIT and scale * y2 <= LIMIT
            hash["#{x1 * scale},#{y1 * scale},#{x2* scale},#{y2 * scale}"] = "yes"
            hash["#{x2 * scale},#{y2 * scale},#{x1 * scale},#{y1 * scale}"] = "yes"
            scale += 1
          end

        else

          scale = 1
          while scale * x1 <= LIMIT and scale * x2 <= LIMIT and scale * y1 <= LIMIT and scale * y2 <= LIMIT
            hash["#{x1 * scale},#{y1 * scale},#{x2* scale},#{y2 * scale}"] = "no"
            hash["#{x2 * scale},#{y2 * scale},#{x1 * scale},#{y1 * scale}"] = "no"
            scale += 1
          end


        end



      end
    end
  end
end


puts count