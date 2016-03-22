FROM alpine:edge

MAINTAINER Serge Fomin <serge.fo@gmail.com>

# Full list of mirrors can be found here http://rsync.alpinelinux.org/alpine/MIRRORS.txt
ENV APK_MIRROR http://mirror.leaseweb.com

# Enabling main, community and testing alpine package repos
RUN echo "$APK_MIRROR/alpine/edge/main" > /etc/apk/repositories
RUN echo "@community $APK_MIRROR/alpine/edge/community" >> /etc/apk/repositories
RUN echo "@testing $APK_MIRROR/alpine/edge/testing" >> /etc/apk/repositories

# Packages required to build things during 'npm install'
RUN apk update \
  && apk add \
    autoconf \
    automake \
    ca-certificates \
    curl \
    g++ \
    gcc \
    git \
    krb5-libs \
    krb5-dev \
    libc-dev \
    libgcc \
    libstdc++ \
    linux-headers \
    make \
    musl \
    nasm \
    nodejs \
    paxctl \
    python \
    tar \
    zlib-dev

# In case there are issues with git+ssh protocol, enable rewrite to https
# ADD ./etc/gitconfig /etc/gitconfig

# Keeping package locally, since there were some issues with the most recent version
# COPY ./nodejs-4.2.1-r0.apk /tmp/nodejs-4.2.1-r0.apk
# RUN apk add --allow-untrusted /tmp/nodejs-4.2.1-r0.apk

RUN rm -rf /tmp/* /var/cache/apk/*

# Disabling progress bar
RUN npm config set progress false -g
