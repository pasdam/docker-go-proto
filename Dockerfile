ARG GO_VERSION=1.13.3-alpine3.10
ARG PROTOC_GO_VERSION=v1.3.2

# Builder image
###############

FROM golang:${GO_VERSION} as builder

RUN apk update --no-cache && \
    apk add git

RUN go get -d -u github.com/golang/protobuf/protoc-gen-go && \
    git -C "$(go env GOPATH)"/src/github.com/golang/protobuf checkout ${PROTOC_GO_VERSION} && \
    go install github.com/golang/protobuf/protoc-gen-go

# Final image
#############

FROM golang:${GO_VERSION}

ARG PROTOC_VERSION=3.6.1-r1

RUN apk update --no-cache && \
    apk add \
        gcc \
        libc-dev \
        make \
        protobuf=${PROTOC_VERSION}

COPY --from=builder /go/bin/protoc-gen-go /usr/bin
