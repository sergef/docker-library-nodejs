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
    nasm \
    nodejs
RUN rm -rf /tmp/* /var/cache/apk/*

RUN mkdir /app
WORKDIR /app
VOLUME /app

# Disabling progress bar
RUN npm config set progress false -g

# In case there are issues with git+ssh protocol,
# enable rewrite to https and http proxy
ENV GIT_DIR /app
RUN git config --global url.https://github.com/.insteadOf git://github.com/
RUN git config --global http.proxy $HTTP_PROXY

RUN npm install -g nodemon

ONBUILD COPY . /app

ONBUILD RUN npm install \
  && mv -f /app/node_modules /tmp/node_modules

CMD rm -rf /app/node_modules || true && ln -s /tmp/node_modules /app \
  && npm start
