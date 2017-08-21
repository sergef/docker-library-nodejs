FROM sergef/docker-library-alpine:3.6

COPY scripts /scripts
COPY entrypoints /entrypoints

COPY .babelrc /app/.babelrc
COPY package.json /app/package.json

WORKDIR /app

RUN chmod +x /scripts/*.sh \
  && chmod +x /entrypoints/*.sh \
  && apk add --no-cache \
    nodejs \
    nodejs-npm \
  && npm install -g nodemon \
  && npm install \
  && npm cache clean

ONBUILD ARG TARGET=release

ONBUILD ARG DEBUG_PORT=9099
ONBUILD ENV DEBUG_PORT=${DEBUG_PORT}
ONBUILD EXPOSE ${DEBUG_PORT}

ONBUILD COPY . /app
ONBUILD RUN \
  cp /entrypoints/${TARGET}.sh /entrypoint.sh \
  && /scripts/${TARGET}.sh

ENTRYPOINT ["tini", "--", "/entrypoint.sh"]
