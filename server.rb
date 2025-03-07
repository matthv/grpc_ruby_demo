require 'grpc'
require_relative './hello_pb'
require_relative './hello_services_pb'

class GreeterServer < Hello::Greeter::Service
  def say_hello(req, _unused_call)
    Hello::HelloReply.new(message: "Hello, #{req.name}!")
  end
end

def main
  server = GRPC::RpcServer.new
  server.add_http2_port('localhost:50051', :this_port_is_insecure)
  server.handle(GreeterServer.new)
  puts "gRPC Server running on localhost:50051"
  server.run_till_terminated
end

main if __FILE__ == $0
