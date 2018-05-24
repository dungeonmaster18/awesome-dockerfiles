FROM alpine:3.7

LABEL maintainer "Umesh Yadav <umesh4257@gmail.com>"

ENV SHFMT_VERSION v2.4.0

RUN apk --no-cache add \
    bash file \
    && wget https://storage.googleapis.com/shellcheck/shellcheck-stable.linux.x86_64.tar.xz \
    && tar --xz -xvf "shellcheck-stable.linux.x86_64.tar.xz" \
    && cp /shellcheck-stable/shellcheck /usr/bin/shellcheck \
    && rm -rf /shellcheck-stable/shellcheck \
    && rm -rf shellcheck-stable.linux.x86_64.tar.xz \
    && chmod +x /usr/bin/shellcheck \
    && wget "https://github.com/mvdan/sh/releases/download/${SHFMT_VERSION}/shfmt_${SHFMT_VERSION}_linux_amd64" -O /usr/bin/shfmt \
    && chmod +x /usr/bin/shfmt

CMD [ "/bin/bash" ]
