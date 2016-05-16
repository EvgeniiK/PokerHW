
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
		#is it right construction "if-else"? or it needs to be compressed?
		print @suit, 
					if @dignity>10 
						letters_dingnity[@dignity]  
					else 
						@dignity
					end
	end
end