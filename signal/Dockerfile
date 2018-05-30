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
    --no-install-recommends

RUN curl -s https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor | apt-key add -
RUN echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list

RUN apt-get update \
    && apt-get install signal-desktop -y

CMD [ "signal-desktop" ]