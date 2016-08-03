
lengths = (1..50000).to_a
widths = (1..50000).to_a

table = []

def getNumSquares(rectangle_l, rectangle_w)

  numSquares = 0
  (1..rectangle_l).each do |length|
    (1..rectangle_w).each do |width|

      numSquares += (rectangle_l - (length-1))*(rectangle_w - (width-1))

    end
  end

  return numSquares
end


diff = 10000

lengths.each do |length|
  widths.each do |width|

    numSquares = getNumSquares(length, width)

    if numSquares > 2001000
      break
    end

    if (numSquares - 2000000).abs < diff
      diff = (numSquares - 2000000).abs
      print numSquares, " length: ",length, " width: ",width, "\n"
    end
  end
 end
