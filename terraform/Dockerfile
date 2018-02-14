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

ENV BUILD_HOME=/build
ENV GOPATH=$BUILD_HOME/golang
ENV PATH=$GOPATH/bin:$PATH
ENV HEKETI_BRANCH="master"

RUN apk add --no-cache glide build-base && mkdir -p $GOPATH/src/github.com/heketi && \
    cd $GOPATH/src/github.com/heketi && \
    git clone -b $HEKETI_BRANCH https://github.com/heketi/heketi.git && \
    cd $GOPATH/src/github.com/heketi/heketi && \
    glide install -v && \
    make && \
    cp heketi /usr/bin/heketi && \
    cp client/cli/go/heketi-cli /usr/bin/heketi-cli && \
    glide cc && \
    cd && rm -rf $BUILD_HOME && apk del build-base glide

RUN export GOPATH=/go

#RUN curl https://glide.sh/get | sh

RUN mkdir -p $GOPATH/src/github.com/alibaba
RUN cd $GOPATH/src/github.com/alibaba 
RUN git clone https://github.com/alibaba/terraform-provider.git $GOPATH/src/github.com/alibaba/
RUN apk add glide && cd $GOPATH/src/github.com/alibaba && go get && glide up 
RUN cd $GOPATH/src/github.com/alibaba make all
RUN cd $GOPATH/src/github.com/alibaba && terraform get && terraform init

ENTRYPOINT /bin/bash
