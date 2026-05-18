FROM alpine:3.19

WORKDIR /app

RUN apk add --no-cache libc6-compat postgresql-client

COPY server /app/server

RUN chmod +x /app/server

EXPOSE 3000

CMD ["/app/server"]
