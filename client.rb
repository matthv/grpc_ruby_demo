require 'grpc'
require_relative './hello_pb'
require_relative './hello_services_pb'

def listen_for_server
  stub = Hello::Greeter::Stub.new('localhost:50051', :this_channel_is_insecure)
  Thread.new do
    loop do
      begin
        response = stub.say_hello(Hello::HelloRequest.new(name: "World"))
        puts "[#{Time.now}] Server response: #{response.message}"
      rescue GRPC::Unavailable => e
        puts "[#{Time.now}] Server unavailable: #{e.message}. Retrying in 5 seconds..."
      rescue StandardError => e
        puts "[#{Time.now}] Unexpected error: #{e.message}. Retrying in 5 seconds..."
      end
      sleep 5
    end
  end
end

listener = listen_for_server
puts "Client started. Press Ctrl+C to exit."
listener.join