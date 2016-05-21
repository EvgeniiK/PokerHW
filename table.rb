require_relative 'deck'

# Contain all cadrs in hand and on table
class Table
  def initialize
    @deck = Deck.new
    @deck.create_new
  end

  def player_hand
    player_cards = []
    2.times { player_cards += [@deck.new_card] }
    player_cards
  end

  def board
    board_cards = []
    5.times { board_cards += [@deck.new_card] }
    board_cards
  end
end
