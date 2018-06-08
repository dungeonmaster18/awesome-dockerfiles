FROM golang:alpine as builder

LABEL maintainer "Umesh Yadav <umesh4257@gmail.com>"

RUN apk --no-cache add \
    git \
    && go get -u github.com/davecheney/httpstat

FROM alpine:3.7

COPY --from=builder /go/bin/httpstat /usr/bin/httpstat

RUN apk --no-cache add ca-certificates

ENTRYPOINT [ "httpstat" ]
CMD [ "--help" ]