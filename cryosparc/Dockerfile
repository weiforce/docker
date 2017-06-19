#FROM dorowu/ubuntu-desktop-lxde-vnc

FROM nvidia/cuda:8.0-cudnn5-devel

RUN apt update
RUN apt-get install -y curl
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:graphics-drivers/ppa -y
RUN apt update
#RUN apt install -y nvidia-381
#RUN export CRYOSPARC_LICENSE_ID="" && mkdir -p $HOME/cryosparc && cd $HOME/cryosparc && export download_url=$(curl --silent -H "cryoSPARC-License: $CRYOSPARC_LICENSE_ID" "https://cryosparc.download/get/latest") && curl --silent "$download_url" > cryosparc.tar.gz && tar -zxvf cryosparc.tar.gz
#./install.sh --license-id=$CRYOSPARC_LICENSE_ID


#FROM dorowu/ubuntu-desktop-lxde-vnc

FROM nvidia/cuda:8.0-cudnn5-devel

RUN apt update
RUN apt-get install -y curl
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:graphics-drivers/ppa -y
RUN apt update
RUN apt install -y nvidia-381
RUN export CRYOSPARC_LICENSE_ID="" && mkdir -p $HOME/cryosparc && cd $HOME/cryosparc && export download_url=$(curl --silent -H "cryoSPARC-License: $CRYOSPARC_LICENSE_ID" "https://cryosparc.download/get/latest") && curl --silent "$download_url" > cryosparc.tar.gz && tar -xz --overwrite -f cryosparc.tar.gz

