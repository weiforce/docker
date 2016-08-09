# coreos docker

## init

    ssh core@yourserverip
    cd /home/core
    git clone https://github.com/ivories/docker.git
    chmod -R 777 docker/shell
    /home/core/docker/shell/shell_init
    export PATH="/home/core/docker/shell:$PATH"
    install_web

## ssh-init

    ssh_config www.youname.com 

## set timezone

    sudo timedatectl set-timezone Asia/Shanghai

## set hostname

    sudo hostnamectl set-hostname yourname

## start/restart web service

    web

## install other service

    install_fleetctl bind # install bind server
    install_fleetctl samba # install samba share
    install_fleetctl git # install git server

## config the server

    cd /home/core/data/nginx
    vi nginx.conf # config nginx domain

    cd /home/core/data/php
    vi php.ini # config php.ini

    cd /home/core/data/mysql
    vi my.cnf # config my.cnf

## command list

    fs param                 #restart service
    fweb                     #restart web service
    fl                       #list all service
    fl param                 #list one service
    install_fleetctl         #install new fleetctl service
    install_systemctl        #install new systemctl service
