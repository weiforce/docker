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

* 每次进入环境可行执行 cd ~ && source i && fweb ,基本服务都可以起来的 
* 如果还是开不了,就运行 fleetctl list-units 找找哪个服务启动不了,再打对应的 fleetctl status mysql
