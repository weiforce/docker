FROM debian:sid-slim

COPY init.sh /etc/init.sh

RUN apt-get update && apt-get -y install glusterfs-server glusterfs-client attr nfs-server&& \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    chmod a+x /etc/init.sh

ENV GLUSTERVOLNAME data

#NFS-SERVER EXPOSE PORT
EXPOSE 111/udp 2049/tcp

#GLUSTER-SERVER EXPOSE PORT 24007 24008
EXPOSE 24007 24008 49152 49153 49154 49155 49156 49157 49158 49159 49160

CMD ["/etc/init.sh"]
