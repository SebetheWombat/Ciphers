class OneTimePad
	def initialize(vigenere)
		@vigenere = vigenere
	end
	def encrypt(msg)
		key_length = msg.gsub(/[^a-zA-Z]/, "").length
		key = ""
		key_length.times do
			key += (97 + rand(26)).chr
		end
		cipher_text = @vigenere.encrypt(msg,key)
		return [cipher_text,key]
	end

end
