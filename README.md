# install web service
    cd /home/core
    git clone https://github.com/ivories/docker.git
    chmod -R 777 docker/shell
    echo 'source ~/docker/shell/shell_init' > ~/i
    source ~/i
    install_web
    fweb

# vagrant

## 经常碰到的问题

* 每次进入环境可行执行下面的命令,基本服务都可以起来的

    cd ~ && source i && fweb

* 如果还是开不了,就看看

    fleetctl list-units
    fleetctl status mysql
