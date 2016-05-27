require_relative 'card'

# Need another name
class Equalizator
  def initialize
    @values = { 10 => 'Royal flush', 9 => 'Straight flush', 8 => 'Quads',
                7 => 'Full house', 6 => 'Flush', 5 => 'Straight', 4 => 'Set',
                3 => 'Two pairs', 2 => 'One pair', 1 => 'High card' }
  end

  def dignity_hash(cards)
    dignities = {}
    cards.each do |card|
      dignities[card.dignity] ||= 0
      dignities[card.dignity] += 1
    end
    dignities
  end

  # Must be independent
  def greater(combo1, combo2)
    d = Determinator.new
    @combo1 = combo1
    @combo2 = combo2
    @dhc1 = dignity_hash(@combo1)
    @dhc2 = dignity_hash(@combo2)
    combo_name = d.determination(cards: combo1)

    if combo_name == d.determination(cards: combo2)
      # If combo one is spades return them, if not than return second
      if combo_name == 'Royal flush'
        @combo1[0].suit == 'S' ? @combo1 : @combo2
      elsif combo_name == 'Straight flush' ||
            combo_name == 'Flush' ||
            combo_name == 'Straight' ||
            combo_name == 'High card'
        highest
      elsif combo_name == 'Full house'
        full_house
      elsif combo_name == 'Quads'
        quads
      elsif combo_name == 'Set'
        set
      elsif combo_name == 'One pair'
        one_pair
      elsif combo_name == 'Two pairs'
        two_pairs
      end

    else
      'Not equal combo'
    end
  end

  # Has no equal combinations
  def quads
    comparor(@dhc1.key(4), @dhc2.key(4))
  end

  # First compare by tree cards combo, then by pair, then by high card
  def full_house
    c = comparor(@dhc1.key(3), @dhc2.key(3))
    c = comparor(@dhc1.key(2), @dhc2.key(2)) unless c
    c = @combo1 unless c
    c
  end

  def set
    c = comparor(@dhc1.key(3), @dhc2.key(3))
    c = highest unless c
    c
  end

  def one_pair
    c = comparor(@dhc1.key(2), @dhc2.key(2))
    c = highest unless c
    c
  end

  # Deletes and remember one card, then checks highest card from pairs left.
  # If equals deletes this highest cards from hash and compare last cards.
  # If equals again, compare by high card.
  def two_pairs
    one_card1 = @dhc1.key(1)
    one_card2 = @dhc2.key(1)

    @dhc1.delete(@dhc1.key(1))
    @dhc2.delete(@dhc2.key(1))

    mc1 = max_card(@dhc1)
    mc2 = max_card(@dhc2)

    c = comparor(mc1, mc2)

    unless c
      @dhc1.delete(mc1)
      @dhc2.delete(mc2)
      c = comparor(@dhc1.key(2), @dhc2.key(2))
    end

    c = comparor(one_card1, one_card2) unless c
    c = @combo2 unless c
    c
  end

  # Compare and return combo. If arguments are equal then return false
  def comparor(first, second)
    if first > second
      @combo1
    elsif first < second
      @combo2
    elsif first == second
      false
    end
  end

  # Polymorph method, shows highest key of hash and highest element of array
  def max_card(cards)
    if cards.class == Hash
      cards.keys.max
    elsif cards.class == Array
      cards.max

    end
  end

  # Highest from two. Return combos. If max elements are equal deletes them
  # and recompare. If all equal return combo1.
  def highest(dhc1: @dhc1, dhc2: @dhc2)
    mc1 = max_card(dhc1)
    mc2 = max_card(dhc2)
    c = comparor(mc1, mc2)
    if dhc1.length > 1
      c = highest(dhc1: dhc1.delete_if { |k, _| k == mc1 },
                  dhc2: dhc2.delete_if { |k, _| k == mc2 }) unless c
    else
      c = @combo1
    end
    c
  end
end
