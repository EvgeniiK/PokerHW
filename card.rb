class Card
	attr_accessor :suit
	attr_accessor :dignity

	def initialize (suit, dignity)
		@suit = suit
		@dignity = dignity
	end

	def show
		#or can initialize all dignities in hash
		#this method brakes when deck differs from origin
		letters_dingnity = {10=>'T',11=>'J',12=>'Q',13=>'K',14=>'A'}
		print @suit, 
		if @dignity>10 
			letters_dingnity[@dignity]  
		else 
			@dignity
		end
	end

end


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
		player_cards = []
		(1..2).each do
			player_cards = player_cards + [@deck.get_card]
		end
		return player_cards
	end

	def board
		board_cards = []	
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
		strait = strait?
		case
		when strait&&strait?&&@dignities.has_key(14)
			puts "flash royal"
		when strait&&strait?
			puts "strait-flush"
		when @dignities.has_value?(4)
			puts "care"			
		when @dignities.has_value?(3)&&@dignities.has_value?(2)
			puts "fullhouse"
		when strait?
			puts "flush"
		when strait
			puts	"strait"
		when @dignities.has_value?(3)
			puts "set"
		when two_pairs?
			puts "two pairs"	
		when @dignities.has_value?(2)
			puts "pair"
	  when @dignities.has_value?(1)
			puts "one"
		end
	end

	private

	def strait?
		@suits.has_value?(5)
	end

	def two_pairs?
		pairs_number = 0
		@dignities.values.each do |value|
			if value==2
				pairs_number+=1
			end
		end
		if pairs_number==2
			return true
		end
	end

  def hashes
  	@cards.each do |card|
  		@suits[card.suit] ||= 0
  		@suits[card.suit] += 1
  		@dignities[card.dignity] ||= 0
  		@dignities[card.dignity] += 1
  	end
  end

#must do when A is 1 
  def strait?
  	if (unic?&&range?)
 			return true
		end
  end
	
 	#checks when every card is unic
	def unic?
		unless (@dignities.has_value?(2)||
 		@dignities.has_value?(3)||
 		@dignities.has_value?(4))
 		return true
 		end
	end

	def range?
	  if (@cards.max_by{|card| card.dignity}.dignity -
  		 @cards.min_by{|card| card.dignity}.dignity == 4)
	  	return true
		end
	end


end

d = Determinator.new
t = Table.new
player_hand = t.player_hand
puts "Player hand is: "
player_hand.each do |ph|
	print ph.show, " "
end
puts

board = t.board
puts
puts "Board is: "
board.each do |b|
	print b.show, " "
end
puts	
puts
puts "Wining combo is:"
d.determination(board)

#d.strait?


#print d.get_card.show, d.get_card.show

#c = Card.new("ace","2")
