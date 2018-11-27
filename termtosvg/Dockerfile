FROM python:3.6.7-alpine3.8

LABEL maintainer "Umesh Yadav <umesh4257@gmail.com>"

RUN apk --no-cache add \
    g++ \
    gcc \
    libxml2-dev \
    libxslt-dev \
    && pip install lxml termtosvg

ENTRYPOINT [ "termtosvg" ]

CMD [ "--help" ]
