FROM alpine:3.7

LABEL maintainer "Umesh Yadav <umesh4257@gmail.com>"

COPY .bashrc /root/.bashrc

RUN apk --no-cache add \
    bash curl bash-completion \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/bin/kubectl

CMD [ "kubectl" ]