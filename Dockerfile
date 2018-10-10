FROM golang:latest as builder

WORKDIR /app/
COPY *.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello

FROM alpine:latest
WORKDIR /app/
COPY --from=builder /app/hello /app/hello

CMD ["./hello"]

