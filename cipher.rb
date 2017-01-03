require 'sinatra'
require 'sinatra/reloader' if development?
require_relative("lib/atbash.rb")
require_relative("lib/caesar.rb")
require_relative("lib/vigenere.rb")
require_relative("lib/railfence.rb")

caesar = Caesar.new()
atbash = Atbash.new()
vigenere = Vigenere.new()
railfence = RailFence.new()

get '/' do
	erb :ciphers
end

post '/' do
	msg = params['encrypt']
	if msg != nil
		@encrypted = atbash.encrypt(msg)
	end
	erb :ciphers
end

get '/caesar' do
	erb :caesar
end

post '/caesar' do
	msg = params['encrypt']
	shifter = params['shift'].to_i
	if msg != nil
		@encrypted = caesar.encrypt(msg, shifter)
	end
	erb :caesar
end

get '/vigenere' do
	erb :vigenere
end

post '/vigenere' do
	msg = params['encrypt']
	key = params['key']
	if msg != nil
		@encrypted = vigenere.encrypt(msg, key)
	end
	erb :vigenere
end

get '/railfence' do
	erb :railfence
end

post '/railfence' do
	msg = params['encrypt']
	rows = params['rows'].to_i
	if msg != nil
		@encrypted = railfence.encrypt(msg, rows)
	end
	erb :railfence
end

