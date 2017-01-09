require_relative("../lib/vigenere.rb")

RSpec.describe Vigenere do
	before(:each) do
		@vigenere = Vigenere.new()
	end

	describe "#validate_key" do
		it "does not accept a numerical key" do
			expect(@vigenere.validate_key("3")).to be_falsey

			expect(@vigenere.validate_key("55")).to be_falsey

			expect(@vigenere.validate_key("0")).to be_falsey
		end

		it "does not accept a non-alpha key" do
			expect(@vigenere.validate_key("...")).to be_falsey

			expect(@vigenere.validate_key("c@t")).to be_falsey

			expect(@vigenere.validate_key("=-9")).to be_falsey
		end

		it "returns true for alpha keys" do
			expect(@vigenere.validate_key("cat")).to be_truthy

			expect(@vigenere.validate_key("dog")).to be_truthy

			expect(@vigenere.validate_key("lemon")).to be_truthy
		end

		it "returns true for alpha keys with space" do
			expect(@vigenere.validate_key("cat bulb")).to be_truthy

			expect(@vigenere.validate_key("dog tree")).to be_truthy

			expect(@vigenere.validate_key("lemon zebra")).to be_truthy
		end
	end

	describe "#encrypt" do
		it "returns a string" do
			expect(@vigenere.encrypt("Hello","cat")).to be_a(String)

			expect(@vigenere.encrypt("","dog")).to be_a(String)
		end

		it "returns an encrypted version of the input string based on the keyword" do
			expect(@vigenere.encrypt("hello", "cat")).to eq("jeeno")

			expect(@vigenere.encrypt("abcdefghi", "birdman")).to eq("bjtgqftiq")
		end

		it "is case sensitive" do
			expect(@vigenere.encrypt("Hello","cat")).to eq("Jeeno")

			expect(@vigenere.encrypt("What a Wonderful DAY", "zebra")).to eq("Vlbk a Vsoueqjvc DZC")
		end

		it "does not alter non alpha characters" do 
			expect(@vigenere.encrypt("Hello there!","ZEBRA")).to eq("Gimco slfie!")

			expect(@vigenere.encrypt("123","abc")).to eq("123")

			expect(@vigenere.encrypt("123!@#'][. ab3","TWENTY")).to eq("123!@#'][. tx3")
		end
	end

end