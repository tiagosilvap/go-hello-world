FROM golang:1.16-buster AS builder
WORKDIR /app
COPY go.* ./
RUN go mod download
COPY *.go ./
RUN go build -o hello

FROM alpine:3.14
WORKDIR /
COPY --from=builder /app/hello /hello
EXPOSE 8080
ENTRYPOINT ["./hello"]