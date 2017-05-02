require "sinatra"

post '/test' do

  puts params["message"] unless params["message"].nil?

end  
