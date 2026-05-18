FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    libpcre2-8-0 \
    libgcc-s1 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY server /app/server

RUN chmod +x /app/server

EXPOSE 3000

CMD ["/app/server"]
