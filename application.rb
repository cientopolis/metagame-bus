require_relative "initializer"
require_relative "message_processor"


kafka = Kafka.new(
# At least one of these nodes must be available:
  seed_brokers: ENV["kafka_server"],

  # Set an optional client id in order to identify the client to Kafka:
  client_id: "metagame",
)

# Consumers with the same group id will form a Consumer Group together.
consumer = kafka.consumer(group_id: "metagame-group")

# It's possible to subscribe to multiple topics by calling `subscribe`
# repeatedly.
consumer.subscribe(ENV["kafka_topic"])

mp = MessageProcessor.new

# This will loop indefinitely, yielding each message in turn.
consumer.each_message do |message|
  #puts message.topic, message.partition,message.offset, message.value
  puts message.value
  begin
    mp.send_message(message.value) 
  rescue
    next
  end  
end
