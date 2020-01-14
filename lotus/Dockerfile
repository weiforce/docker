FROM ubuntu

RUN apt update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt update
RUN apt install -y golang-go gcc git bzr jq pkg-config mesa-opencl-icd ocl-icd-opencl-dev

RUN apt install -y llvm
RUN apt install -y clang

RUN apt install -y curl
RUN curl https://sh.rustup.rs > a.sh 
RUN sh a.sh -y


RUN git clone https://github.com/filecoin-project/lotus.git 

ENV IPFS_GATEWAY "https://proof-parameters.s3.cn-south-1.jdcloud-oss.com/ipfs/"

RUN cd lotus && make clean && make all
RUN cd lotus && go build -o lotus-bench ./cmd/lotus-bench

RUN apt install -y supervisor
COPY supervisord.conf /supervisor/supervisord.conf

CMD /usr/bin/supervisord -c /supervisor/supervisord.conf -n
