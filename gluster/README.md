# 开启服务
sudo docker run --name gluster -d -v /data/glusterfs/etc:/etc/glusterfs:z -v /data/glusterd/lib:/var/lib/glusterd:z -v /data/glusterfs/log:/var/log/glusterfs:z -v /sys/fs/cgroup:/sys/fs/cgroup:ro -d --privileged=true --net=host -v /dev/:/dev ivories/gluster

# 编辑 /etc/hosts
192.168.5.201   server-01
192.168.5.202   server-02
192.168.5.203   server-03

# 连接服务器 在 192.168.5.201 发起连接
gluster peer probe 192.168.5.202
gluster peer probe 192.168.5.203

# 设置分区
gluster volume create vol_distributed transport tcp \
192.168.5.201:/var/lib/glusterd/data \
192.168.5.202:/var/lib/glusterd/data \
192.168.5.203:/var/lib/glusterd/data force

gluster peer probe master.hadoop.com && gluster peer probe slave1.hadoop.com && gluster peer probe slave2.hadoop.com && gluster peer probe slave3.hadoop.com


gluster volume create data master.hadoop.com:/gluster/brick slave1.hadoop.com:/gluster/brick slave2.hadoop.com:/gluster/brick slave3.hadoop.com:/gluster/brick
gluster volume create data replica 4 transport tcp master.hadoop.com:/gluster/brick slave1.hadoop.com:/gluster/brick slave2.hadoop.com:/gluster/brick slave3.hadoop.com:/gluster/brick


gluster volume start data
mount -t glusterfs 127.0.0.1:/data /data
echo "/data 127.0.0.1(rw,sync,no_root_squash)" /etc/exports

gluster pool list

echo "UUID=0dd7f959-8174-44d5-b5a4-a77b394e6ad7" > /var/lib/glusterd/glusterd.info
echo "operating-version=30800" >> /var/lib/glusterd/glusterd.info
