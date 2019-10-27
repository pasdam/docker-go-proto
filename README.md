# docker-go-proto

Docker image to build go project with proto files.

It contains:

* [Go](https://golang.org/);
* [make](https://www.gnu.org/software/make/);
* [protobuf](https://developers.google.com/protocol-buffers/) compiler;
* [protoc-gen-go](https://github.com/golang/protobuf) plugins.

## Example

To compile your project:

```sh
docker run -v `pwd`:/opt/app pasdam/docker-go-proto:latest protoc -I=opt/app/proto --go_out=/opt/app/generated/pkg /opt/app/proto/your_proto.proto
```

or if you have a makefile:

```sh
docker run -v `pwd`:/opt/app pasdam/docker-go-proto:latest make -C /opt/app build
```
