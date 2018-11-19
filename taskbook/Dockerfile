FROM alpine:3.7

LABEL maintainer "Umesh Yadav <umesh4257@gmail.com>"

RUN apk --no-cache add \
    nodejs \
    && npm install --global taskbook

ENTRYPOINT [ "tb" ]

CMD [ "--help" ]
