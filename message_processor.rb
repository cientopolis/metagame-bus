require_relative "initializer"

class MessageProcessor

  attr_reader :event,:player, :project

  def initialize
    #REST client
    @connection = Faraday.new(:url => ENV["METAGAME_API"]) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  #Send the message to Metagame-API
  def send_message(message)
    message = JSON.parse(message)
    params = {email:message["email"],project:message["project"],event:message["event"],count:message["count"]}
    @connection.get '/activities', params
  end

end
