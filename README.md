# go-grpc-greeter-server

```console
$ docker run -d -p50051:50051 ghcr.io/kuoss/go-grpc-greeter-server
302a7745bea051fd9b881ea0022dc393abbee6f9092312292c59e9399450b388
```
```console
$ docker logs gg
server listening at [::]:50051
```
```console
$ grpcurl -plaintext localhost:50051 list
grpc.examples.echo.Echo
grpc.reflection.v1.ServerReflection
grpc.reflection.v1alpha.ServerReflection
helloworld.Greeter
```
```console
$ grpcurl -plaintext localhost:50051 list helloworld.Greeter
helloworld.Greeter.SayHello
```
```console
$ grpcurl -plaintext localhost:50051 describe helloworld.Greeter
helloworld.Greeter is a service:
service Greeter {
  rpc SayHello ( .helloworld.HelloRequest ) returns ( .helloworld.HelloReply );
}
```
```console
$ grpcurl -plaintext localhost:50051 describe helloworld.Greeter.SayHello
helloworld.Greeter.SayHello is a method:
rpc SayHello ( .helloworld.HelloRequest ) returns ( .helloworld.HelloReply );
```
```console
$ grpcurl -plaintext localhost:50051 describe helloworld.HelloRequest
helloworld.HelloRequest is a message:
message HelloRequest {
  string name = 1;
}
```
```console
$ grpcurl -plaintext -format text -d 'name: "gRPCurl"' localhost:50051 helloworld.Greeter.SayHello
message: "Hello gRPCurl"
```

docs
- https://kubernetes.github.io/ingress-nginx/examples/grpc/
- https://github.com/GoogleCloudPlatform/istio-samples/tree/master/sample-apps/grpc-greeter-go
