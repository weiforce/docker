service glusterfs-server start
service rpcbind start
service nfs-common start
mkdir -p /data

tail -f /var/log/glusterfs/etc-glusterfs-glusterd.vol.log
