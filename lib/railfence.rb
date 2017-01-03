class RailFence
	def encrypt(msg, rows)
		msg.gsub!(" ", "")
		encrypted = []
		rows.times do 
			encrypted << []
		end
		cur_row = 0
		add = true
	 	msg.each_char do |c|
	 		encrypted[cur_row] << c

			if cur_row >= rows -1
	 			add = false
	 		elsif cur_row <= 0
	 			add = true
	 		end

	 		if add
	 			cur_row += 1
	 		else
	 			cur_row -= 1
	 		end
		end
		encrypted.map! { |word|
			word.join("")
		}.join(" ")
	end
end
