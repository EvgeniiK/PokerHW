require '../determinator'
require '../deck'
require '../card'
require '../table'
require 'pry'

describe Table do
  table = Table.new
  determinator = Determinator.new
  deck = Deck.new
  deck.create_new

  it 'check player hand' do
    player_cards = table.player_hand
    expect(player_cards.first). to be_kind_of(Card)
  end

  it 'check board' do
    board = table.board
    expect(board.first). to be_kind_of(Card)
  end

end