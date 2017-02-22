require_relative("../lib/vigenere.rb")
require_relative("../lib/one_time_pad.rb")

RSpec.describe OneTimePad do
	before(:each) do
		vigenere = Vigenere.new()
		@otp = OneTimePad.new(vigenere)
	end

	describe "#encrypt" do
		it "should return an array containing 2 strings" do
			otp_value = @otp.encrypt("Hello there!")
			expect(otp_value[0]).to be_a(String)
			expect(otp_value[1]).to be_a(String)
			expect(otp_value.length).to eq(2)
		end

		it "should not return the same cipher text or key when run multiple times on the same plain text" do
			first_cipher = @otp.encrypt("Hello friend")
			second_cipher = @otp.encrypt("Hello friend")

			expect(first_cipher[0]).not_to eq(second_cipher[0])
			expect(first_cipher[1]).not_to eq(second_cipher[1])
		end

		it "should return a key that is the same length as the number of alpha characters in the plain text" do
			msg = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
			otp_value = @otp.encrypt(msg)
			key = otp_value[1]
			expect(key.length).to eq(msg.length)

			msg = "abc defg hij klm nop qrst uv wxyz!"
			otp_value = @otp.encrypt(msg)
			key = otp_value[1]
			expect(key.length).to eq(26)
		end
	end
end