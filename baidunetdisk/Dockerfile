FROM ubuntu:18.04

RUN apt update
RUN apt install -y wget
RUN wget https://issuecdn.baidupcs.com/issue/netdisk/LinuxGuanjia/3.5.0/baidunetdisk_3.5.0_amd64.deb

RUN apt-get -qqy install \
    supervisor \
    wget \
    x11vnc \
    xvfb \
    websockify \
    i3status \
    i3-wm \
    desktop-file-utils \
    libappindicator3-1 \
    libasound2 \
    libnss3 \
    libgtk-3-0 \
    libfontconfig \
    libfreetype6 \
    libgbm-dev \
    libnotify4 \
    libsecret-1-0 \
    xfonts-cyrillic \
    xfonts-scalable \
    fonts-liberation \
    fonts-ipafont-gothic \
    fonts-wqy-zenhei \
    xdg-utils

RUN dpkg -i baidunetdisk_3.5.0_amd64.deb

CMD /opt/baidunetdisk/baidunetdisk --no-sandbox
