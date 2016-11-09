require 'waterdrop'
require 'json'
require 'pry'
WaterDrop.setup do |config|
  config.send_messages = true
  config.connection_pool_size = 20
  config.connection_pool_timeout = 1
  config.kafka.hosts = ['localhost:9092']
  config.raise_on_failure = true
end

file = File.read('log.json')
file_hash = JSON.parse(file)

file_hash.each{ |log|
  binding.pry
  message = WaterDrop::Message.new('test', log.to_json)
  message.send!

 }
