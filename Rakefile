task :generate do
  sh "grpc_tools_ruby_protoc -I proto --ruby_out=. --grpc_out=. proto/hello.proto"
  file = "hello_services_pb.rb"
  content = File.read(file).sub("require 'hello_pb'", "require_relative './hello_pb'")
  File.write(file, content)
end