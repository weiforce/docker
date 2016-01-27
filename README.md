# install web service
    cd /home/core
    git clone https://github.com/ivories/docker.git
    chmod -R 777 docker/shell
    ./docker/shell/shell_init
    ./docker/shell/install_web
    ./docker/shell/fweb

## 常用命令

    s param #本地开发,重启某个服务
    fs param #服务器,重启某个服务
    web #本地开发,重启所有WEB服务
    fweb #服务器,重启所有WEB服务
    fl #查看所有服务
    fl param #查看某个服务

## 经常碰到的问题

