require 'sinatra'
require 'json'
require 'sinatra/reloader' if development?
require_relative("lib/atbash.rb")
require_relative("lib/caesar.rb")
require_relative("lib/vigenere.rb")
require_relative("lib/railfence.rb")
require_relative("lib/beaufort.rb")
require_relative("lib/one_time_pad.rb")

caesar = Caesar.new()
atbash = Atbash.new()
vigenere = Vigenere.new()
railfence = RailFence.new()
beaufort = Beaufort.new(vigenere,atbash)
otp = OneTimePad.new(vigenere)

get '/' do
	erb :ciphers
end

post '/' do
	msg = params['encrypt']
	if msg != nil
		@encrypted = atbash.encrypt(msg)
	end
	content_type :json
	{encrypted: @encrypted}.to_json

end

get '/caesar' do
	erb :caesar
end

post '/caesar' do
	msg = params['encrypt']
	shifter = params['key']
	if shifter != ""
		shifter = shifter.to_i
		@encrypted = caesar.encrypt(msg, shifter)
	end
	content_type :json
	{encrypted: @encrypted}.to_json
end

get '/beaufort' do
	erb :beaufort
end

post '/beaufort' do
	msg = params['encrypt']
	key = params['key']
	if key != ""
		if vigenere.validate_key(key)
			@encrypted = beaufort.encrypt(msg, key)
		end
	end
	content_type :json
	{encrypted: @encrypted}.to_json
end
get '/vigenere' do
	erb :vigenere
end

post '/vigenere' do
	msg = params['encrypt']
	key = params['key']
	if key != ""
		if vigenere.validate_key(key)
			@encrypted = vigenere.encrypt(msg, key)
		end
	end
	content_type :json
	{encrypted: @encrypted}.to_json
end

get '/railfence' do
	erb :railfence
end

post '/railfence' do
	msg = params['encrypt']
	rows = params['key']
	if rows != ""
		rows = rows.to_i
		@encrypted = railfence.encrypt(msg, rows)
	end
	content_type :json
	{encrypted: @encrypted}.to_json
end

get '/one_time_pad' do
	erb :one_time_pad
end

post '/one_time_pad' do
	msg = params['encrypt']
	otp_values = otp.encrypt(msg)
	@encrypted = otp_values[0]
	@key = otp_values[1]
	content_type :json
	{encrypted: @encrypted, key: @key}.to_json
end
