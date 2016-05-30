require '../determinator'
require '../deck'
require '../card'
require 'pry'

describe Determinator do
  determinator = Determinator.new

  it 'must return number of One paie' do
    expect(determinator.combo_value(combo_name: 'One pair')).to be_eql(2)
  end

  it 'must return number of Set' do
    expect(determinator.combo_value(combo_name: 'Set')).to be_eql(4)
  end

  it 'must return number of Flush' do
    expect(determinator.combo_value(combo_name: 'Flush')).to be_eql(6)
  end

  it 'must determine Flush' do
    flush = []
    card1 = Card.new(suit: 'H', dignity: 2)
    card2 = Card.new(suit: 'H', dignity: 4)
    card3 = Card.new(suit: 'H', dignity: 5)
    card4 = Card.new(suit: 'H', dignity: 6)
    card5 = Card.new(suit: 'H', dignity: 10)
    flush<<card1<<card2<<card3<<card4<<card5
    expect(determinator.determination(cards: flush)).to be_eql('Flush')
  end

  it 'must determine one pair' do
    one_pair = []
    card1 = Card.new(suit: 'J', dignity: 2)
    card2 = Card.new(suit: 'J', dignity: 2)
    card3 = Card.new(suit: 'H', dignity: 5)
    card4 = Card.new(suit: 'H', dignity: 6)
    card5 = Card.new(suit: 'H', dignity: 10)
    one_pair<<card1<<card2<<card3<<card4<<card5
    expect(determinator.determination(cards: one_pair)).to be_eql('One pair')
  end

  it 'must determine two pair' do
    two_pair = []
    card1 = Card.new(suit: 'J', dignity: 2)
    card2 = Card.new(suit: 'J', dignity: 2)
    card3 = Card.new(suit: 'H', dignity: 5)
    card4 = Card.new(suit: 'H', dignity: 5)
    card5 = Card.new(suit: 'H', dignity: 10)
    two_pair<<card1<<card2<<card3<<card4<<card5
    expect(determinator.determination(cards: two_pair)).to be_eql('Two pairs')
  end

  it 'must determine set' do
    set = []
    card1 = Card.new(suit: 'S', dignity: 2)
    card2 = Card.new(suit: 'S', dignity: 2)
    card3 = Card.new(suit: 'H', dignity: 2)
    card4 = Card.new(suit: 'H', dignity: 5)
    card5 = Card.new(suit: 'H', dignity: 10)
    set<<card1<<card2<<card3<<card4<<card5
    expect(determinator.determination(cards: set)).to be_eql('Set')
  end

  it 'must determine straight' do
    straight = []
    card1 = Card.new(suit: 'H', dignity: 14)
    card2 = Card.new(suit: 'D', dignity: 13)
    card3 = Card.new(suit: 'D', dignity: 12)
    card4 = Card.new(suit: 'C', dignity: 11)
    card5 = Card.new(suit: 's', dignity: 10)
    straight<<card1<<card2<<card3<<card4<<card5
    expect(determinator.determination(cards: straight)).to be_eql('Straight')
  end

  it 'must determine low straight' do
    straight = []
    card1 = Card.new(suit: 'H', dignity: 14)
    card2 = Card.new(suit: 'D', dignity: 2)
    card3 = Card.new(suit: 'D', dignity: 3)
    card4 = Card.new(suit: 'C', dignity: 5)
    card5 = Card.new(suit: 's', dignity: 4)
    straight<<card1<<card2<<card3<<card4<<card5
    expect(determinator.determination(cards: straight)).to be_eql('Straight')
  end

  it 'must determine Royal flush ' do
    straight = []
    card1 = Card.new(suit: 'H', dignity: 14)
    card2 = Card.new(suit: 'H', dignity: 12)
    card3 = Card.new(suit: 'H', dignity: 10)
    card4 = Card.new(suit: 'H', dignity: 13)
    card5 = Card.new(suit: 'H', dignity: 11 )
    straight<<card1<<card2<<card3<<card4<<card5
    expect(determinator.determination(cards: straight)).to be_eql('Royal flush')
  end

end