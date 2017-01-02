require 'sinatra'
require 'sinatra/reloader' if development?
require_relative("lib/atbash.rb")
require_relative("lib/caesar.rb")

caesar = Caesar.new()
atbash = Atbash.new()

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

