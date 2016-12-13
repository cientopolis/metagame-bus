require_relative "initializer"

class MessageProcessor

  attr_reader :event,:player, :project

  def initialize
    #REST client
    @connection = Faraday.new(:url => ENV["metagame_api"]) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end  
  end

  def send_message(message)
    message = JSON.parse(message)
    params = {email:message["userid"],project:message["project"]}
    
    case message["event"]
    when "contribution"
      @connection.get '/contribution', params
    when "reinforcement"
      @connection.get '/reinforcement',params    
    when "social"
      @connection.get '/social', params
    end
  end

end
