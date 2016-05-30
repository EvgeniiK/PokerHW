require '../card'
require 'pry'

describe Card do
  card = Card.new(suit: 'H', dignity: 2)

  it "expect suit field of card" do
    expect(card.suit).to include('H')
  end

  it "expect dignity field of card" do
    expect(card.dignity).to be_equal(2)
  end

end