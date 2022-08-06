FROM golang:1.16-buster AS builder
WORKDIR /app
COPY go.* ./
RUN go mod download
COPY *.go ./
RUN go build -ldflags -w

FROM scratch
WORKDIR /
COPY --from=builder /app/helloworld /helloworld
EXPOSE 8080
ENTRYPOINT ["./helloworld"]