FROM ubuntu:20.04 as builder

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake clang git

RUN git clone https://github.com/radareorg/sdb.git
WORKDIR /sdb
RUN make

FROM ubuntu:20.04

COPY --from=builder /sdb/src/sdb /
CMD ["/sdb"]
