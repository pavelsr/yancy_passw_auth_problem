FROM alpine:3.10

LABEL maintainer "Pavel Serikov <pavelsr@cpan.org>"

# libmysqlclient-dev
# docker build -t pavelsr/yancy-mysql . 2>&1 | tee docker-build.log

COPY cpanfile /

RUN apk update && \
  apk add perl perl-dev expat-dev perl-io-socket-ssl g++ make curl bash mariadb-dev mariadb-client && \
  curl -fsSL --compressed https://git.io/cpm > /usr/local/bin/cpm && \
  chmod +x /usr/local/bin/cpm
  
RUN cpm install -gv

WORKDIR /app
