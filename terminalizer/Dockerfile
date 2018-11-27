FROM alpine:3.7

LABEL maintainer "Umesh Yadav <umesh4257@gmail.com>"

RUN apk --no-cache add \
    build-base \
    python \
    nodejs \
    gcc \
    --update make \
    && npm install -g node-gyp terminalizer --unsafe-perm

ENTRYPOINT [ "terminalizer" ]

CMD [ "--help" ]
