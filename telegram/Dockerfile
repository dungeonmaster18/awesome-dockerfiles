FROM debian:stable-slim

LABEL maintainer "Umesh Yadav <umesh4257@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    apt-utils \
    apt-transport-https \
    ca-certificates \
    curl \
    tar \
    xz-utils \
    gnupg \
    software-properties-common \
    --no-install-recommends

RUN curl -LO https://telegram.org/dl/desktop/linux \
    && tar --xz -xvf  linux \
    && mv Telegram/ /opt/ \
    && ln -sf /opt/Telegram/Telegram /usr/bin/telegram

CMD [ "telegram" ]