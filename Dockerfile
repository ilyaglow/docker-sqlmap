FROM alpine
LABEL maintainer "contact@ilyaglotov.com"

RUN apk update \
  && apk add --no-cache python \
                       git \
                       \
  && git clone --depth=1 \
               --branch=master \
               https://github.com/sqlmapproject/sqlmap.git \
               /sqlmap \
               \
  && adduser -D sqlmap \
  && mkdir /data \
  && chown -R sqlmap /sqlmap /data \
  \
  && apk del git \
  && rm -rf /sqlmap/.git \
  && rm -rf /var/cache/apk/*

USER sqlmap

VOLUME /data

WORKDIR /sqlmap

ENTRYPOINT ["python", "sqlmap.py"]
