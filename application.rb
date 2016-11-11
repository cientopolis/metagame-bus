require_relative "initializer"

kafka = Kafka.new(
# At least one of these nodes must be available:
  seed_brokers: ENV["kafka_server"],

  # Set an optional client id in order to identify the client to Kafka:
  client_id: "metagame",
)

#REST client
connection = Faraday.new(:url => ENV["metagame_api"]) do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end


# Consumers with the same group id will form a Consumer Group together.
#TODO: Ver grupos kafka 
consumer = kafka.consumer(group_id: "metagame-group")

# It's possible to subscribe to multiple topics by calling `subscribe`
# repeatedly.
consumer.subscribe(ENV["kafka_topic"])



# This will loop indefinitely, yielding each message in turn.
consumer.each_message do |message|
  #puts message.topic, message.partition,message.offset, message.value
  puts message.value
  connection.post "/test", {message: message.value}
end
