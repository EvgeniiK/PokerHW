require_relative 'card'

# This is a deck with cards
class Deck
  def initialize
    @suits = %w( H D C S )
    @dignities = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    @deck = []
  end

  # Or can be named "renew" because needs to use this method every new game
  def create_new
    @suits.each do |suit|
      @dignities.each do |dignity|
        @deck += [Card.new(suit: suit, dignity: dignity)]
      end
    end
  end

  def show
    puts 'Cards in deck:'
    @deck.each { |card| print card.suit, card.dignity, ' ' }
    puts
  end

  def new_card
    @deck.delete(@deck.sample)
  end

  def card?(card: 'input one card')
    @deck.include? card
  end
end
