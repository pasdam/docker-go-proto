# docker-go-proto

---

**DEPRECATED**

This image is deprecated, please use [uber/prototool](https://hub.docker.com/r/uber/prototool) instead.

---

Docker image to build go projects with proto files.

It contains:

* [Go](https://golang.org/);
* [make](https://www.gnu.org/software/make/);
* [protobuf](https://developers.google.com/protocol-buffers/) compiler;
* [protoc-gen-go](https://github.com/golang/protobuf) plugins.

## Example

To compile your project:

```sh
docker run --rm -v `pwd`:/opt/app pasdam/docker-go-proto:latest protoc -I=opt/app/proto --go_out=/opt/app/generated/pkg /opt/app/proto/your_proto.proto
```

or if you have a makefile:

```sh
docker run --rm -v `pwd`:/opt/app pasdam/docker-go-proto:latest make -C /opt/app build
```

## Limitations

The images based on Alpine are [not able to execute](https://github.com/golang/go/issues/14481) the `go race` command as of now.
