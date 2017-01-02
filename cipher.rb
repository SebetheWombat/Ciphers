require 'sinatra'
require 'sinatra/reloader' if development?
require_relative("lib/atbash.rb")

atbash = Atbash.new()

get '/' do
	msg = params['encrypt']
	if msg != nil
		@encrypted = atbash.encrypt(msg)
	end
	erb :ciphers
end