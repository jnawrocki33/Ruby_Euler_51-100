
class Card
  attr_reader :str
  def initialize(str)
    @card = str
  end

  def get_suit
    return @card[@card.size - 1]
  end

  def get_value
    return 10 if @card[0] == 'T'
    return 11 if @card[0]  == 'J'
    return 12 if @card[0] == 'Q'
    return 13 if @card[0] == 'K'
    return 14 if @card[0] == 'A'
    return @card[0].to_i
  end
end

class Hand

  attr_reader :cards
  def initialize(cards)
    @hand = []
    cards.each do |card|
      @hand.push(Card.new(card))
    end
    @hand.sort_by! do |card|
      card.get_value
    end
  end

  def print_hand
    print '['
    @hand.each do |card|
      print card.get_value, card.get_suit, ' '
    end
    print "]\n"
  end

  def same_suit?
    val = true
    (0..@hand.size - 2).each do |index|
      val = false if @hand[index].get_suit != @hand[index + 1].get_suit
    end
    return val
  end

  def consecutive?
    val = true
    (0..@hand.size - 2).each do |index|
      val = false if @hand[index].get_value != @hand[index + 1].get_value - 1
    end
    return val
  end

  def number_like_values
    possibilities = []
    num = 1
    value = @hand[0].get_value
    (1..@hand.size - 1).each do |index|
      if @hand[index].get_value == @hand[index-1].get_value
        num += 1
        value = @hand[index].get_value
        possibilities.push([num, value]) if index == @hand.size - 1
      else
        possibilities.push([num, value])
        num = 1
        value = @hand[index].get_value
        possibilities.push([1, @hand[index].get_value]) if index == @hand.size - 1
      end
    end
    possibilities.sort_by! do |group|
      [group[0], group[1]]
    end
    return possibilities #[num, value]
  end


  def get_rank

    if self.same_suit?
      if self.consecutive?
        return 10 if @hand[0].get_value == 10 #royal flush
        return [9,@hand[0].get_value] #straight flush
      else
        return [6,@hand.last.get_value] #flush
      end

    else
      likeValues = self.number_like_values
      return [4, likeValues.last[1], likeValues[0][1]]if likeValues.last[0] == 4
      return [7, likeValues.last[1], likeValues[0][1]]if likeValues.last[0] == 3 and likeValues[0][0] == 2

      return [5, @hand.last.get_value] if self.consecutive? #straight
      return [4, likeValues.last[1], likeValues[1][1], likeValues[0][1]]if likeValues.last[0] == 3 #3 of kind
      return [3, likeValues.last[1], likeValues[1][1], likeValues[0][1]] if likeValues.last[0] == 2 and likeValues[1][0] == 2 #two pairs
      return [2, likeValues.last[1], likeValues[2][1], likeValues[1][1], likeValues[0][1]]if likeValues.last[0] == 2 #one pair
      return [1, likeValues.last[1], likeValues[3][1], likeValues[2][1], likeValues[1][1], likeValues[0][1]] #high card

    end
  end
end


fileObj = File.new('poker.txt', 'r')
hands = []
while (line = fileObj.gets)
  hands.push(line)
end
fileObj.close


count = 0
hands.each do |line|
  array = line.split
  hand1 = Hand.new([array[0], array[1], array[2], array[3], array[4]])
  hand2 = Hand.new([array[5],array[6], array[7], array[8], array[9]])
  a1 = hand1.get_rank
  a2 = hand2.get_rank
  i = 0
  while true
    if a1[i] == a2[i]
      i += 1
    else
      count += 1 if a1[i] > a2[i]
      break
    end
  end

end

puts count