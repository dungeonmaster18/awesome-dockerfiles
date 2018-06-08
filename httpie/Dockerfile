FROM alpine:3.7

LABEL maintainer "Umesh Yadav <umesh4257@gmail.com>"

RUN apk add --no-cache python3 \
    && pip3 install --upgrade pip setuptools httpie \
    && rm -r /root/.cache

ENTRYPOINT [ "http" ]
CMD ["--help"]