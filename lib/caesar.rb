class Caesar
	def encrypt(msg, shifter)
		s = shifter
		msg.split("").map { |c|
			if (65..90).include? c.ord
				((((c.ord - 65) + s) % 26) + 65).chr
			elsif (97..122).include? c.ord
				((((c.ord - 97) + s) % 26) + 97).chr
			else
				c
			end		
		}.join("")
	end
end

