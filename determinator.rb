require_relative 'equalizator'

# Has all counting methods
class Determinator
  def initialize
    @values = { 10 => 'Royal flush', 9 => 'Straight flush', 8 => 'Quads',
                7 => 'Full house', 6 => 'Flush', 5 => 'Straight', 4 => 'Set',
                3 => 'Two pairs', 2 => 'One pair', 1 => 'High card' }
    @e = Equalizator.new
  end

  # Return numeric value of combo name
  def combo_value(combo_name: 'input combo name')
    @values.key(combo_name)
  end


  def combo_counter(cards: 'Input cards')
    highest_value = 0
    highest_combo = ''
    cards.combination(5).to_a.each do |combo|
      value = combo_value(combo_name: determination(cards: combo))
      if highest_value < value
        highest_value = value
        highest_combo = combo
      elsif highest_value == value
        highest_combo = @e.greater(highest_combo, combo)
      end
    end
    highest_combo
  end

  def determination(cards: 'input 5 cards')
    hashes(cards)
    if strait? && flush? && @dignities.key?(14)
      @values[10]
    elsif strait? && flush?
      @values[9]
    elsif quads?
      @values[8]
    elsif set? && one_pair?
      @values[7]
    elsif flush?
      @values[6]
    elsif strait?
      @values[5]
    elsif set?
      @values[4]
    elsif two_pairs?
      @values[3]
    elsif one_pair?
      @values[2]
    elsif high_card?
      @values[1]
    end
  end

  #private

  def quads?
    @dignities.value?(4)
  end

  def flush?
    @suits.value?(5)
  end

  # Has exception or all cards are unic and 5 cards in order
  def strait?
    strait_exeption? || range? ? true : false
  end

  def set?
    @dignities.value?(3)
  end

  def two_pairs?
    pairs_number = 0
    @dignities.values.each do |value|
      pairs_number += 1 if value == 2
    end
    pairs_number == 2 ? true : false
  end

  def one_pair?
    @dignities.value?(2)
  end

  def high_card?
    @dignities.value?(1)
  end

  def hashes(cards)
    @suits = {}
    @dignities = {}
    cards.each do |card|
      @suits[card.suit] ||= 0
      @suits[card.suit] += 1
      @dignities[card.dignity] ||= 0
      @dignities[card.dignity] += 1
    end
  end

  def strait_exeption?
    [14, 2, 3, 4, 5].all? { |value| @dignities.key?(value) }
  end

  # checks when every card is unic
  # I need "if there only "1" value", but i dont know how to do this
  def unique?
    @dignities.values.all? { |value| value == 1 } ? true : false
  end

  # this method must work whith 'unic?'
  def range?
    unique? && @dignities.keys.minmax.reduce(:-) == -4 ? true : false
  end
end
