class Vigenere
	def validate_key(key)
		key.gsub!(" ", "")
		return false if key.match(/[^a-zA-Z]/)
		return true
	end

	def encrypt(msg, key)
		
		key = key.downcase.split("").map { |c| c.ord - 97}
		encrypted = []
		i = 0
		msg.split("").each { |c|
			if (65..90).include? c.ord
				encrypted << ((((c.ord - 65) + key[i]) % 26) + 65).chr
				i = (i + 1) % key.length
			elsif (97..122).include? c.ord
				encrypted << ((((c.ord - 97) + key[i]) % 26) + 97).chr
				i = (i + 1) % key.length
			else
				encrypted << c
			end	
				
		}
		encrypted.join("")
	end
end
