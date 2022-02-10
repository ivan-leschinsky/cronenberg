FROM golang:1.17.6-bullseye as build-step
# RUN git clone --depth=1 --branch=master https://github.com/ivan-leschinsky/cronenberg.git /cronenberg
WORKDIR /cronenberg
COPY . .
ENV GO111MODULE=auto
RUN make build

FROM debian:bullseye-slim
COPY --from=build-step /cronenberg/cronenberg /sbin/cronenberg
CMD ["/sbin/cronenberg"]
