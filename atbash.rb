mapped = Hash.new()
26.times do |i|
	mapped[(i + 97).chr] = (25 - i + 97).chr
	mapped[(i + 65).chr] = (25 - i + 65).chr
end

def encrypt(msg, mapped)
	encrypted = msg.split("").map { |c| 
		if ((65..90).include? c.ord) || ((97..122).include? c.ord)
			mapped[c]
		else
			c
		end
	}.join("")
end

puts encrypt("Hello there!", mapped)
puts encrypt("abc", mapped)
puts encrypt("xyz", mapped)