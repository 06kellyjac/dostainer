FROM debian:bullseye-slim as builder
RUN apt-get update && apt-get install --yes --no-install-recommends gcc=4:9.2.1-3.1 libc6-dev=2.31-3
COPY ./app/allocate-memory.c /
RUN gcc -static -s /allocate-memory.c -o /allocate-memory

FROM debian:bullseye-slim
COPY ./app/*.sh /app/
COPY --from=builder /allocate-memory /app/
ENV PATH=$PATH:"/app"
