require_relative("../lib/railfence.rb")

RSpec.describe RailFence do
	before(:each) do
		@railfence = RailFence.new
	end

	describe "#encrypt" do
		it "returns a string" do
			expect(@railfence.encrypt("Hello", 3)).to be_a(String)
		end

		it "returns the same number of words as the given number of rows" do
			str = @railfence.encrypt("What are you doing Dave?", 5).split(" ")
			expect(str.length).to eq(5)

			str = @railfence.encrypt("How about a game of tic-tac-toe", 3).split(" ")
			expect(str.length).to eq(3)
		end

		it "does not alter any characters" do
			str = "swordfish"
			encrypted_str = @railfence.encrypt(str,3)
			str.each_char do |c|
				expect(encrypted_str).to include(c)
			end

			encrypted_str.gsub(" ", "").each_char do |c|
				expect(str).to include(c)
			end
		end

		it "rearranges characters in the given messages according to the given number of rows" do
			expect(@railfence.encrypt("Strange women lying in ponds distributing swords",7)).to eq("Slds tnysigw reidsno amnntir nogortd gwipius enb")

			expect(@railfence.encrypt("He's dead Jim",3)).to eq("HdJ esedi 'am")
		end
	end

end