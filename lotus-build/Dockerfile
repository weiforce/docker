FROM ivories/cuda

RUN apt update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt update
RUN apt install -y golang-go gcc git bzr jq pkg-config mesa-opencl-icd ocl-icd-opencl-dev
RUN apt install -y supervisor

RUN apt install -y llvm
RUN apt install -y clang

RUN apt install -y curl
RUN curl https://sh.rustup.rs > a.sh 
RUN sh a.sh -y

