class Card
	attr_accessor :suit
	attr_accessor :dignity

	def initialize (suit, dignity)
		@suit = suit
		@dignity = dignity
	end

	def show
		print @suit,@dignity
	end

end


class Deck
	attr_accessor :suits
	attr_accessor :dignities

	#new deck, with another card types can be set when object is created
	#or changed later
	def initialize (
		suits = ['H','D','C','S'],
		dignities = ['2','3','4','5','6','7','8','9','T','J','Q','K','A'])
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
		@deck.each do |card|
			print card.suit, card.dignity, " " 
		end
		puts
	end

	def get_card
		@deck.delete card = @deck.sample
		return card
	end

	#need to write comparator to compare whith "Card.new("H",2)"
	def have_card? (card)
		@deck.include? card
	end

end


class Table
	def initialize
		@deck = Deck.new
		@deck.create_new

	end

	def player_hand
		puts "Player hand is: "
		(1..2).each do
			print @deck.get_card.show, ' '
		end
		puts
	end

	def board
		board_cards = []	
		#puts "Boad is: "
		(1..5).each do
			board_cards = board_cards + [@deck.get_card]
		end
		return board_cards
	end
end

class Determinator
	def initialize
		@suits = {}
		@dignities = {}
	end

	def determination(cards)
		@cards = cards
		hashes
		case
			when @dignities.has_value?(4)
				puts "care"			
			when @dignities.has_value?(3)&&@dignities.has_value?(2)
				puts "fullhouse"
			when @suits.has_value?(5)
				puts "flush"
#make Strait
			when @dignities.
				puts	"strait"
			when @dignities.has_value?(3)
				puts "set"
			when @dignities.has_value?(2)
				puts "pair"
		  when @dignities.has_value?(1)
				puts "one"
		end
		puts @suits
		puts @dignities
	end


  private	def hashes
  	@cards.each do |card|
  		@suits[card.suit] ||= 0
  		@suits[card.suit] += 1
  		@dignities[card.dignity] ||= 0
  		@dignities[card.dignity] += 1
  	end
  end


#make strait
  def strait?
  	@cards.sort_by {|card| card.dignity}.each do |card|
  		puts card.show
  	end


  	#Deck.dignities
  end
end

d = Determinator.new
t = Table.new
t.player_hand
d.determination(t.board)
d.strait?


#print d.get_card.show, d.get_card.show

#c = Card.new("ace","2")
