FROM ivories/lotus-build

RUN git clone https://github.com/filecoin-project/lotus.git

ENV IPFS_GATEWAY "https://proof-parameters.s3.cn-south-1.jdcloud-oss.com/ipfs/"

RUN cd lotus && make clean && make debug


