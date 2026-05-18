FROM crystallang/crystal:1.14.0-alpine AS builder

WORKDIR /app

COPY shard.yml ./
RUN shards install 

COPY src/ ./src/

RUN crystal build src/server.cr --release --static --no-debug -o server

FROM alpine:3.19

RUN apk add --no-cache libc6-compat postgresql-client

WORKDIR /app

COPY --from=builder /app/server /app/server

RUN chmod +x /app/server

EXPOSE 3000

CMD ["/app/server"]
