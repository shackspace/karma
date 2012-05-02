require 'sinatra'
require 'sinatra/respond_to'

Sinatra::Application.register Sinatra::RespondTo

configure do
	mime_type :xsd, 'text/xml'
end

get '/' do
  respond_to do |wants|
    wants.html { haml :index }      
		wants.xml { haml :index }
  end
end

# renders test.xsd which defines the reply format for any ".xml" reply
#
get '/test', :provides => :xsd do
	content_type :xsd
	haml :test	
end

__END__
@@ index.html
.content Hello world!

@@ index.xml
!!!
%Test{ 'xmlns:xsi' => "http://www.w3.org/2001/XMLSchema-instance", 'xsi:noNamespaceSchemaLocation' => "test.xsd" }
	%Something oh my!
	%SomethingElse whatever could go wrong?!

@@ test.xsd
!!!
%xs:schema{ :elementFormDefault => "qualified", 'xmlns:xs' => "http://www.w3.org/2001/XMLSchema" }
  %xs:element{ :name => "Test" }
    %xs:complexType
      %xs:sequence
        %xs:element{ :name => "Something", :type => "xs:string" }
        %xs:element{ :name => "SomethingElse", :type => "xs:string" }
