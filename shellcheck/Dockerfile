FROM alpine:3.7

LABEL maintainer "Umesh Yadav <umesh4257@gmail.com>"

RUN apk --no-cache add \
    bash file \
    && wget https://storage.googleapis.com/shellcheck/shellcheck-stable.linux.x86_64.tar.xz \
    && tar --xz -xvf "shellcheck-stable.linux.x86_64.tar.xz" \
    && cp /shellcheck-stable/shellcheck /usr/bin/shellcheck \
    && rm -rf /shellcheck-stable/shellcheck \
    && rm -rf shellcheck-stable.linux.x86_64.tar.xz \
    && chmod +x /usr/bin/shellcheck

CMD [ "shellcheck" ]