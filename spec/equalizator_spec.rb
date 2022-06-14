require '../determinator'
require '../card'
require 'pry'

describe Equalizator do

  equal = Equalizator.new

  it 'checking higher combination' do
    straight1 = []
    straight2 = []
    card1 = Card.new(suit: 'S', dignity: 14)
    card2 = Card.new(suit: 'H', dignity: 13)
    card3 = Card.new(suit: 'H', dignity: 12)
    card4 = Card.new(suit: 'C', dignity: 11)
    card5 = Card.new(suit: 'H', dignity: 10)
    straight1<<card1<<card2<<card3<<card4<<card5
    card1 = Card.new(suit: 'H', dignity: 14)
    card2 = Card.new(suit: 'C', dignity: 2)
    card3 = Card.new(suit: 'C', dignity: 3)
    card4 = Card.new(suit: 'S', dignity: 4)
    card5 = Card.new(suit: 'C', dignity: 5)
    straight2<<card1<<card2<<card3<<card4<<card5
    expect(equal.greater(straight1, straight2)).to be_eql(straight1)
  end

end