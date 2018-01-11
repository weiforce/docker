FROM laslabs/alpine-cfssl

USER root

RUN apk --no-cache add gettext ca-certificates openssl \
    && wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 -O /usr/local/bin/dumb-init \
    && wget https://storage.googleapis.com/kubernetes-release/release/v1.9.1/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod a+x /usr/local/bin/kubectl /usr/local/bin/dumb-init \
    && apk --no-cache del ca-certificates openssl

ENV TERRAFORM_VERSION=0.11.1

RUN apk add --update git bash openssh

ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

RUN apk add --no-cache inotify-tools

ENTRYPOINT /bin/bash
