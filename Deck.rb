require_relative 'Card'

class Deck
	attr_accessor :suits
	attr_accessor :dignities

	#new deck, with another card types can be set when object is created
	#or changed later
	def initialize (
		suits = ['H','D','C','S'],
		dignities = [2,3,4,5,6,7,8,9,10,11,12,13,14])
		@suits = suits
		@dignities = dignities
		@deck = []
	end

	#or can be named "renew" because needs to use this method every new game
	def create_new
		suits.each do |suit|
			dignities.each do |dignity|
				@deck =  @deck + [Card.new(suit, dignity)]
			end
		end
	end

	def show
		puts "Cards in deck:"
		@deck.each { |card| print card.suit, card.dignity, " " }
		puts
	end

	def get_card
		@deck.delete card = @deck.sample
	end

	#need to write comparator to compare whith "Card.new("H",2)"
	def have_card? (card)
		@deck.include? card
	end

end