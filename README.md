# gRPC Ruby Demo

This project is a simple implementation of a **gRPC** service in Ruby. It includes:
- A gRPC server (`server.rb`) that responds to requests.
- A gRPC client (`client.rb`) that sends requests in a loop and detects if the server restarts.
- A `.proto` file (`proto/hello.proto`) defining the gRPC service.

## 🚀 Installation

### Install dependencies
```bash
bundle install
```

### Generate gRPC files
```
bundle exec rake generate
```
This will generate the files `hello_pb.rb` and `hello_services_pb.rb`.


## 🏃‍♂️ Running the server
```bash
ruby server.rb
```
You should see the message `gRPC Server running on localhost:50051`

## 🚴‍♂️ Running the client
```bash
ruby client.rb
```
The client will:

- Send a request to the server every 5 seconds.
- Display the server's response.
- Detect if the server is unavailable and retry.

If the server is stopped:
- [2025-03-07 12:00:00] Server unavailable: 14:failed to connect to all addresses. Retrying in 5 seconds...

## 🛠 Modifying the gRPC Service
If you modify the `proto/hello.proto` file, you need to regenerate the gRPC files:
```bash
bundle exec rake generate
```