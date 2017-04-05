FROM alpine:edge

RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update && apk add --no-cache tar libarchive-tools libgcc gmp curl

RUN curl -Lsf 'https://github.com/jgm/pandoc/releases/download/1.17.2/pandoc-1.17.2-1-amd64.deb' \
    | bsdtar -xOf - data.tar.gz | tar -xz --strip-components 2 -C /usr
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2


