require_relative 'Deck'

class Table
	def initialize
		@deck = Deck.new
		@deck.create_new
	end

	#how can i do this without return?
	def player_hand
		player_cards = []
		2.times { player_cards = player_cards + [@deck.get_card] }
		return player_cards
	end

	def board
		board_cards = []	
		5.times { board_cards = board_cards + [@deck.get_card] }
		return board_cards
	end
end