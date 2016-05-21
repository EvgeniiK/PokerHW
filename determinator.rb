require_relative 'table'

# Has all counting methods
class Determinator
  def initialize
    @suits = {}
    @dignities = {}
  end

  def card_combo(mas,mas1)
    print mas
    puts
    (0..mas.length-1).each do |i|
      m1 = mas[i]
      mas[i] = mas1[0]
      print "six combo", mas
      puts
      (0..mas.length-1).each do |j|
        m2 = mas[j]
        mas[j] = mas1[1]
        print "seven combo", mas
        mas[j] = m2
    end
    mas[i] = m1
    end
  end

  def combo_value(combo_name)
    values = {'Flash royal'=>1, 2=>'Strait flush', 3=> 'Kare',
             4=>'Fullhouse', 5=>'Flush', 6=>'Set', 7=> 'Two pairs',
             8=>'Pair',9=>'One'}
    values[combo_name]
  end

  def determination(cards)
    @cards = cards
    hashes
    strait = strait?


    if strait && flush? && @dignities.has_key(14)
      puts 'flash royal'
    elsif strait && flush?
      puts 'strait-flush'
    elsif @dignities.value?(4)
      puts 'care'
    elsif @dignities.value?(3) && @dignities.value?(2)
      puts 'fullhouse'
    elsif flush?
      puts 'flush'
    elsif strait
      puts 'strait'
    elsif @dignities.value?(3)
      puts 'set'
    elsif two_pairs?
      puts 'two pairs'
    elsif @dignities.value?(2)
      puts 'pair'
    elsif @dignities.value?(1)
      puts 'one'
    end
  end

  private

  def flush?
    @suits.value?(5)
  end

  def two_pairs?
    pairs_number = 0
    @dignities.values.each do |value|
      pairs_number += 1 if value == 2
    end
    pairs_number == 2 ? true : false
  end

  def hashes
    @cards.each do |card|
      @suits[card.suit] ||= 0
      @suits[card.suit] += 1
      @dignities[card.dignity] ||= 0
      @dignities[card.dignity] += 1
    end
  end

  def strait?
    strait_exeption? || unic? && range? ? true : false
  end

  # By brute force. try methaprogremming
  def strait_exeption?
  true if @dignities.has_key?(14)&&
          @dignities.has_key?(5)&&
          @dignities.has_key?(4)&&
          @dignities.has_key?(3)&&
          @dignities.has_key?(2)
  end

  # checks when every card is unic
  # I need "if there only "1" value", but i dont know how to do this
  def unic?
    true unless @dignities.has_value?(2)||
                @dignities.has_value?(3)||
                @dignities.has_value?(4)
  end

  #this method must to go after unic?
  def range?
    true if @cards.max_by{|card| card.dignity}.dignity -
            @cards.min_by{|card| card.dignity}.dignity == 4
  end
end


d = Determinator.new
t = Table.new
player_hand = t.player_hand
puts "Player hand is: "
player_hand.each {|ph| print ph.show, " "}
puts





board = t.board
puts
puts "Board is: "
board.each {|b| print b.show, " "}
puts
puts
puts "Wining combo is:"
d.determination(board)
d.card_combo([1,2,3,4,5], [9,8])
# To do: brute forse 7card combo's && find highest combo from mas of comboname
