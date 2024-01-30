# go-grpc-greeter-server

```console
$ docker run --name gg -p50051:50051 -d ghcr.io/kuoss/go-grpc-greeter-server
302a7745bea051fd9b881ea0022dc393abbee6f9092312292c59e9399450b388
$ grpcurl -plaintext localhost:50051 list
grpc.examples.echo.Echo
grpc.reflection.v1.ServerReflection
grpc.reflection.v1alpha.ServerReflection
helloworld.Greeter
```
