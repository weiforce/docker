FROM alpine

ENV TERM="xterm-color" KUBE_VER="v1.5.6"
ENV KUBE_MANIFESTS_URL="https://raw.githubusercontent.com/kubernetes/kubernetes/${KUBE_VER}/cluster/images/hyperkube"

RUN apk -q --no-progress add --update build-base autoconf libtool git mercurial go rsync linux-headers ca-certificates iptables
RUN mkdir -p /build/src && export GOPATH="/build" 
RUN go get -d github.com/kubernetes/kubernetes > /dev/null 2>&1 || true 

RUN apk add bash

RUN git clone -b v1.5.6 --depth 1 https://github.com/kubernetes/kubernetes 

ENV GOPATH="/kubernetes/staging/src:/kubernetes"
 
#RUN /kubernetes/hack/build-go.sh cmd/hyperkube 

RUN apk add tar 
#RUN apk add  xz-libs xz libseccomp
#RUN apk add docker
RUN apk add --update \
    python \
    py-pip \
    py-cffi \
    py-cryptography curl \
  && pip install --upgrade pip \
  && apk add --virtual build-deps \
    gcc \
    libffi-dev \
    python-dev \
    linux-headers \
    musl-dev \
    openssl-dev \
  && pip install gsutil 

RUN /kubernetes/hack/get-build.sh v1.5.6
RUN /kubernetes/hack/get-build.sh release/stable
CMD /bin/bash
#RUN cd /kubernetes/ && make quick-release

#RUN mv ./_output/local/bin/linux/amd64/hyperkube && \
#    mkdir -p /etc/kubernetes/manifests /etc/kubernetes/manifests-multi && \
#    wget -qO- ${KUBE_MANIFESTS_URL}/master-multi.json | sed "s/gcr.io\/google_containers/nebelpfade/g;s/VERSION/${KUBE_VER}/g" > /etc/kubernetes/manifests-multi/master-multi.json && \
#    wget -qO- ${KUBE_MANIFESTS_URL}/master.json | sed "s/gcr.io\/google_containers/nebelpfade/g;s/VERSION/${KUBE_VER}/g" > /etc/kubernetes/manifests/master.json && \
  
#RUN apk -q --no-progress del --purge build-base autoconf libtool git mercurial go rsync linux-headers && cd / && rm -rf /var/cache/apk/* /tmp/* /build
