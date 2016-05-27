# Run this
require_relative 'deck'
require_relative 'card'
require_relative 'determinator'

# Contain all cadrs in hand and on table
class Table
  def initialize
    @determinator = Determinator.new
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

  # Show time in ms and number of iterations
  def check_times(combo_name)
    board_cards = []
    i = 0
    start = Time.now
    match = false
    while
      5.times { board_cards += [@deck.new_card!] }
      i += 1
      break if @determinator
                      .determination(cards: board_cards) == combo_name
      board_cards = []
    end
    finish = Time.now
    diff = (finish - start) * 10**3
    return diff, i, board_cards
  end

  def run_game
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~'

    player_turn

    dealer_turn

    winner_is

    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~'
  end

  def player_turn
    @ph = player_hand
    puts 'Player hand is: '
    Card.show_many(cards: @ph)
    puts
  end

  def dealer_turn
    @board_cards = board
    puts 'Board is: '
    Card.show_many(cards: @board_cards)
    puts
  end

  def winner_is
    puts 'Wining combo is:'
    combo = @determinator.combo_counter(cards: @ph + @board_cards)
    print @determinator.determination(cards: combo), ' ',
          Card.show_many(cards: combo)
    puts
  end
end

table = Table.new
table.run_game

ct = table.check_times('Straight flush')
print 'Time: ', ct[0]
puts
print 'Iterations: ', ct[1]
puts
print 'Combo: '
print  Card.show_many(cards: ct[2])
