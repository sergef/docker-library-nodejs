FROM %DOCKER_REGISTRY%docker-library-alpine

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
    make \
    tar \
    python \
    nodejs

RUN mkdir /app
WORKDIR /app
VOLUME /app

# Keeping package locally, since there were some issues with the most recent version
# COPY ./nodejs-4.2.1-r0.apk /tmp/nodejs-4.2.1-r0.apk
# RUN apk add --allow-untrusted /tmp/nodejs-4.2.1-r0.apk

RUN rm -rf /tmp/* /var/cache/apk/*

# Disabling progress bar
RUN npm config set progress false -g

# In case there are issues with git+ssh protocol,
# enable rewrite to https and http proxy
ENV GIT_DIR /app
RUN git config --global url.https://github.com/.insteadOf git://github.com/
RUN git config --global http.proxy $HTTP_PROXY

RUN npm install -g grunt-cli bower nodemon
