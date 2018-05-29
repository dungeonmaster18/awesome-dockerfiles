FROM alpine:3.7

LABEL maintainer "Umesh Yadav <umesh4257@gmail.com>"

ENV NOTARY_VERSION v0.6.1

RUN apk --no-cache add \
    ca-certificates \
    && wget "https://github.com/theupdateframework/notary/releases/download/${NOTARY_VERSION}/notary-Linux-amd64" -O /usr/bin/notary \
    && chmod +x /usr/bin/notary

ENTRYPOINT [ "notary" ]

CMD [ "help" ]