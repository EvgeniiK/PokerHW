# This is class Card
class Card
  attr_accessor :suit
  attr_accessor :dignity

  def initialize(suit: nil, dignity: nil)
    @suit = suit
    @dignity = dignity
    @letters_dingnity = { 10 => 'T', 11 => 'J',
                          12 => 'Q', 13 => 'K', 14 => 'A' }
  end

  def show
    # Or can initialize all dignities in hash
    print @suit, @dignity >= 10 ? @letters_dingnity[@dignity] : @dignity
  end

  def self.show_many(cards: 'Input cards')
    cards.each { |card| print card.show, ' ' }
    puts
  end

end
