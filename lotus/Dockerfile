FROM archlinux:latest

WORKDIR /

RUN pacman -Syu --noconfirm opencl-icd-loader
RUN pacman -S --noconfirm base-devel
RUN pacman -Syu --noconfirm go gcc git bzr jq pkg-config opencl-icd-loader opencl-headers

RUN git clone https://github.com/filecoin-project/lotus

WORKDIR /lotus

ENV IPFS_GATEWAY "https://proof-parameters.s3.cn-south-1.jdcloud-oss.com/ipfs/"

#RUN sed -i "/const gateway = \"https://ipfs.io/ipfs/\"/const gateway = \"https://proof-parameters.s3.cn-south-1.jdcloud-oss.com/ipfs/\"/g" build/paramfetch.go

RUN make clean all && make install

RUN touch ~/.profile

#ENTRYPOINT ["/lotus/lotus", "daemon", "&"]
CMD "/lotus/lotus" "daemon"
