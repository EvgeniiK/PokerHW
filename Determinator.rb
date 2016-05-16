require_relative 'Table'

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
		when strait&&flush?&&@dignities.has_key(14)
			puts "flash royal"
		when strait&&flush?
			puts "strait-flush"
		when @dignities.has_value?(4)
			puts "care"			
		when @dignities.has_value?(3)&&@dignities.has_value?(2)
			puts "fullhouse"
		when flush?
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

	def flush?
		@suits.has_value?(5)
	end

	def two_pairs?
		pairs_number = 0

		@dignities.values.each do |value|
			pairs_number+=1 if value==2
		end
		
		true if pairs_number==2
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
  	true if strait_exeption?||unic?&&range?
  end

  #by brute force
  def strait_exeption?
	true if @dignities.has_key?(14)&&
					@dignities.has_key?(5)&&
					@dignities.has_key?(4)&&
			 		@dignities.has_key?(3)&&
			 		@dignities.has_key?(2)
  end
	
 	#checks when every card is unic
 	#I need "if there only "1" value", but i dont know how to do this
	def unic?
		true unless @dignities.has_value?(2)||
					 			@dignities.has_value?(3)||
 								@dignities.has_value?(4)
	end

	#this method must to go after unic?
	def range?
	  true if @cards.max_by{|card| card.dignity}.dignity -
	  			  @cards.min_by{|card| card.dignity}.dignity == 4
	end
end


d = Determinator.new
t = Table.new
player_hand = t.player_hand
puts "Player hand is: "
player_hand.each {|ph| print ph.show, " "}
puts

board = t.board
puts
puts "Board is: "
board.each {|b|	print b.show, " "}
puts	
puts
puts "Wining combo is:"
d.determination(board)
#to do: brute forse 7card combo's && find highest combo from mas of combonames