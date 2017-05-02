require_relative "../../initializer"

module Connectable

  TOPIC = ENV["KAFKA_TOPIC"]
  SERVER = ENV["KAFKA_SERVER"]

  #Gem initialization
  WaterDrop.setup do |config|
    config.send_messages = true
    config.connection_pool_size = 20
    config.connection_pool_timeout = 1
    config.kafka.hosts = SERVER
    config.raise_on_failure = true
  end

  def send_message(message)
    WaterDrop::Message.new(TOPIC, message.to_json).send!
  end

end
