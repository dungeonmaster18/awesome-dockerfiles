FROM debian:stretch-slim

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
    libasound2 \
    libxkbfile1 \ 
    libnotify4 \
	libgtk-3-0 \
	libx11-xcb1 \
    gconf2 \
	gconf-service \
	gvfs-bin \
    libpulse-dev \
    xdg-utils \
    software-properties-common \
    --no-install-recommends

RUN curl _LO https://updates.tdesktop.com/tlinux/tsetup.1.2.17.tar.xz \
    && tar --xz -xvf tsetup.1.2.17.tar.xz \
    && mv Telegram/ /opt/ \
    && ln -sf /opt/Telegram/Telegram /usr/bin/telegram

CMD [ "telegram" ]