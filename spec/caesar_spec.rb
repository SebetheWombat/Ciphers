require_relative("../lib/caesar.rb")

RSpec.describe Caesar do
	before(:each) do
		@caesar = Caesar.new()
	end

	describe "#encrypt" do
		it "returns a string" do
			expect(@caesar.encrypt("",3)).to be_a(String)

			expect(@caesar.encrypt("Hello",3)).to be_a(String)

			expect(@caesar.encrypt("123",3)).to be_a(String)
		end

		it "returns an encrypted string based on the given key" do
			expect(@caesar.encrypt("hello", 3)).to eq("khoor")

			expect(@caesar.encrypt("hello", 13)).to eq("uryyb")

			expect(@caesar.encrypt("abcdefghijklmnopqrstuvwxyz", 5)).to eq("fghijklmnopqrstuvwxyzabcde")
		end

		it "is case sensitive" do
			expect(@caesar.encrypt("HELLO",3)).to eq("KHOOR")

			expect(@caesar.encrypt("abCDEfgHIjK", 7)).to eq("hiJKLmnOPqR")
		end

		it "does not alter non alpha characters" do
			expect(@caesar.encrypt("12345",7)).to eq("12345")

			expect(@caesar.encrypt("Hello my honey, hello my baby! Hello my ragtime gal!",9)).to eq("Qnuux vh qxwnh, qnuux vh kjkh! Qnuux vh ajpcrvn pju!")
		end

		it "returns an appropriately encrypted string for keys larger then 26" do
			expect(@caesar.encrypt("Hello",29)).to eq("Khoor")
		end
	end

end