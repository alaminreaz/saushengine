require 'bunny'
require 'json'
require 'securerandom'

message = ARGV[0]

conn = Bunny.new
conn.start
ch = conn.create_channel
q = ch.queue "saushengine", durable: true
q.publish message, persistent: true
puts "Sent #{message}"
conn.close

