# Stage 1: Build
FROM golang:1.22.0 AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .

# Stage 2: Run
FROM alpine:latest  

RUN apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/UTC /etc/localtime && \
    echo "UTC" > /etc/timezone && \
    apk del tzdata

COPY --from=builder /app/main /usr/local/bin/main

EXPOSE 8080

CMD ["main"]
