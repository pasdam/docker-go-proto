ARG GO_VERSION=1.13.3-alpine3.10

FROM golang:${GO_VERSION}

ARG PROTOC_VERSION=3.6.1-r1
ARG PROTOC_GO_VERSION=v1.3.2

RUN apk update && \
    apk add --no-cache \
        git \
        make \
        protobuf=${PROTOC_VERSION}

RUN go get -d -u github.com/golang/protobuf/protoc-gen-go && \
    git -C "$(go env GOPATH)"/src/github.com/golang/protobuf checkout ${PROTOC_GO_VERSION} && \
    go install github.com/golang/protobuf/protoc-gen-go
