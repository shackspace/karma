require 'sinatra'
require 'sinatra/respond_to'
require 'webrick'
require 'webrick/https'
require 'openssl'

CERT_PATH = '../cert/'

webrick_options = {
        :Port               => 8443,
        :Logger             => WEBrick::Log::new($stderr, WEBrick::Log::DEBUG),
        :DocumentRoot       => Dir.pwd,
        :SSLEnable          => true,
        :SSLVerifyClient    => OpenSSL::SSL::VERIFY_NONE,
        :SSLCertificate     => OpenSSL::X509::Certificate.new(  File.open(File.join(CERT_PATH, "karma.crt")).read),
        :SSLPrivateKey      => OpenSSL::PKey::RSA.new(          File.open(File.join(CERT_PATH, "karma.key")).read),
        :SSLCertName        => [ [ "CN",WEBrick::Utils::getservername ] ]
}


class SSLServer < Sinatra::Base

configure do
	register SSLServer::Sinatra::RespondTo
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


end


Rack::Handler::WEBrick.run SSLServer, webrick_options
