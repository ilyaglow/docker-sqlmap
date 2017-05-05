FROM alpine
LABEL maintainer "contact@ilyaglotov.com"

RUN apk update && \
    apk add python \
    git \
  && rm -rf /var/cache/apk/*

RUN adduser -g sqlmap -D sqlmap

USER sqlmap
RUN git clone --depth=1 \
    --branch=master \
    https://github.com/sqlmapproject/sqlmap.git \
    /home/sqlmap/sqlmap

USER root
RUN apk del git \
  && rm -rf /home/sqlmap/sqlmap/.git
USER sqlmap

WORKDIR /home/sqlmap/sqlmap
ENTRYPOINT ["python", "sqlmap.py"]
