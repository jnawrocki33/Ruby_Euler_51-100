require 'byebug'

path1 = ['1','6','7']
path2 = ['2','7','8']
path3 = ['3','8','9']
path4 = ['4','9','10']
path5 = ['5','10','6']



def check_remaining(digits, targetSum, last_num, endNum, currentString, note)

  #success base case
  if digits.size == 1
    currentSum = digits[0] + last_num + endNum
    if currentSum == targetSum
      currentString += "#{digits[0]}#{last_num}#{endNum}"
      return currentString
    end
    return nil
  end

  digits.each do |num1|

    d1 = digits.clone
    currentSum = num1
    d1.delete(num1)
    currentSum += last_num


    d1.each do |num2|
      d2 = d1.clone

      currentSum += num2
      if currentSum == targetSum
        d2.delete(num2)
        check = check_remaining(d2, targetSum, num2, endNum, currentString + "#{num1}#{last_num}#{num2};", note)
        return check if check
      end
      currentSum -= num2
    end


  end

  #fail base case
  return nil


end





digits = [1,2,3,4,5,6,7,8,9,10]
answers = []

def rotate(answer)

  while answer[0]>answer[4] or answer[0]>answer[8] or answer[0]>answer[12] or answer[0]>answer[16]
    array = answer.split(";")
    answer = "#{array[1]};#{array[2]};#{array[3]};#{array[4]};#{array[0]}"
  end
  return answer
end

digits.each do |num1|
  targetSum = num1
  d1 = digits.clone
  d1.delete(num1)
  d1.each do |num2|
    targetSum = num1 + num2
    d2 = d1.clone
    d2.delete(num2)
    endNum = num2 #last num of last path
    d2.each do |num3|
      targetSum = num3 + num2 + num1
      d3 = d2.clone
      d3.delete(num3)
      last_num = num3 #this is second num of next path
      note = 0

      # puts "nope"
      currentString = check_remaining(d3, targetSum, last_num, endNum,"#{num1}#{num2}#{num3};", note)


      if currentString
        #print currentString
        a = currentString.split(";")
        sum = 0
        (0..2).each do |index|
          sum += a[0][index].to_i
        end
        #puts "   sum: #{sum}"
        answers.push(rotate (currentString))
      end


    end


  end





end

# array = []
# answers.each do |answer|
#    array.push(answer) i
# end

puts answers.uniq.sort
puts array.sort

puts ""





















=begin
def check_remaining(digits, targetSum, prev_last_num)


  if digits.size == 1
    byebug

  end
  return true if digits.empty?



  digits_copy = digits.clone
  digits_copy.each do |num1|

    currSum = 0
    currSum += num1
    digits.delete(num1)
    currSum += prev_last_num
    digits_copy2 = digits.clone
    digit_needed = targetSum - currSum



    if digits.include?(digit_needed)
      digits.delete(digit_needed)
      if check_remaining(digits, targetSum, digit_needed)
        print num1, prev_last_num, digit_needed, "\n"
        return true
      end
    end

    digits = digits_copy2


    #remember to restore digits!!
  end

  return false


end



#full_digits = [1,2,3,4,5,6,7,8,9] #not deleted
full_digits = [1,2,3,4,5,6]

full_digits.clone.each do |num|

  currSum = num
  full_digits.delete(num)

  full_digits.each do |num1|
    digits = full_digits.clone #first number must be 10
    currSum += num1
    digits.delete(num1)

    digits.each do |num2|
      digitCopy = digits.clone

      currSum += num2
      digitCopy.delete(num2)

      prev_last_num = num2
      check = check_remaining(digitCopy, currSum, prev_last_num)
      print num, num1, num2, "\n" if check

    end

  end

  end

=end
