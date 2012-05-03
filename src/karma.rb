require 'sinatra'
require 'sinatra/respond_to'

Sinatra::Application.register Sinatra::RespondTo

configure do
	mime_type :xsd, 'text/xml'
end

get '/' do
	respond_to do |wants|
		wants.html { haml :index }
	end
end

# render a specific user's info page
get '/users/:id' do
	respond_to do |wants|
		wants.html { haml :user }
	end
end

