require 'sinatra'
require 'sinatra/reloarder' if development?

get '/' do
	"Hello World"
end