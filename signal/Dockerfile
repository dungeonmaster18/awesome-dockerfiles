FROM ubuntu:xenial

LABEL maintainer "Umesh Yadav <umesh4257@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    apt-utils \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN curl -s https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor | apt-key add -
RUN echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list

RUN apt-get update \
    && apt-get install -y \
    signal-desktop \
    libasound2 \
    libxkbfile1 \ 
    libnotify4 \
    libgtk-3-0 \
    libx11-xcb1 \
    gconf2 \
    gconf-service \
    libpulse-dev \
    gvfs-bin \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

CMD [ "signal-desktop" ]