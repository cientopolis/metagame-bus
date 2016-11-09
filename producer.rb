require_relative "initializer"

WaterDrop.setup do |config|
  config.send_messages = true
  config.connection_pool_size = 20
  config.connection_pool_timeout = 1
  config.kafka.hosts = ENV["kafka_server"]
  config.raise_on_failure = true
end

file = File.read('log.json')
file_hash = JSON.parse(file)

file_hash.each{ |log|
  message = WaterDrop::Message.new('test', log.to_json)
  message.send!

 }