require '../deck'
require 'pry'

describe Deck do
  deck = Deck.new
  deck.create_new

  it 'should create a deck' do
    expect(deck).to be_a_kind_of(Deck)
  end

  it 'should be a card' do
    card = deck.new_card
    expect(card).to be_a_kind_of(Card)
  end

  it 'check is this a card' do
    expect(deck.card?(card: 'H3')).to be_truthy
  end

end