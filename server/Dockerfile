# build image #
FROM golang:1.18 AS build

WORKDIR /src

# Don't use the Go proxy because it's blocked on my laptop (lul)
ENV GOPRIVATE=*

# Copy over the files.
COPY . .

# Run the unit tests.
RUN go test -race ./...

# Run go vet
RUN go vet ./...

# Make sure go fmt was run.
# If this fails, you should configure your editor to run `gofmt` on save.
RUN test -z $(go fmt ./...)

# Install the binary.
RUN go install -v ./warp-server

# Final image
FROM ubuntu:22.04

# Install root certs for HTTPS
RUN apt-get update && \
	apt-get install -y --no-install-recommends ca-certificates

# Copy the binary from the build image
COPY --from=build /go/bin /usr/local/bin

# Copy over our pre-encoded media.
COPY media /media
