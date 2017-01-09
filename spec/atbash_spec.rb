require_relative("../lib/atbash.rb")

RSpec.describe Atbash do
	before(:each) do
		@atbash = Atbash.new
	end
	describe "#encrypt" do
		it "returns a string" do
			expect(@atbash.encrypt("Hello")).to be_a(String)

			expect(@atbash.encrypt("")).to be_a(String)
		end

		it "returns an encrypted version of the input string" do
			expect(@atbash.encrypt("hello")).to eq("svool")

			expect(@atbash.encrypt("abcdef")).to eq("zyxwvu")
		end

		it "is case sensitive" do
			expect(@atbash.encrypt("Hello")).to eq("Svool")

			expect(@atbash.encrypt("What a Wonderful DAY")).to eq("Dszg z Dlmwviufo WZB")
		end

		it "does not alter non alpha characters" do 
			expect(@atbash.encrypt("Hello there!")).to eq("Svool gsviv!")

			expect(@atbash.encrypt("123")).to eq("123")

			expect(@atbash.encrypt("123!@#'][. ab3")).to eq("123!@#'][. zy3")
		end
	end
end