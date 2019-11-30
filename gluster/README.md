# 开启服务
sudo docker run --name gluster -d -v /data/glusterfs/etc:/etc/glusterfs:z -v /data/glusterfs/block:/block:z -v /data/glusterfs/log:/var/log/glusterfs:z -v /sys/fs/cgroup:/sys/fs/cgroup:ro -d --privileged=true --net=host -v /dev/:/dev ivories/gluster

# 编辑 /etc/hosts
192.168.5.201   server-01
192.168.5.202   server-02
192.168.5.203   server-03

# 连接服务器 在 192.168.5.201 发起连接
gluster peer probe 192.168.5.202
gluster peer probe 192.168.5.203

# 设置分区 使用备份方式 3台机器都重复数据 模式说明 https://blog.csdn.net/hxpjava1/article/details/79817078
gluster volume create block replica 3 transport tcp \
192.168.5.201:/block \
192.168.5.202:/block \
192.168.5.203:/block force


#gluster volume create data master.hadoop.com:/gluster/brick slave1.hadoop.com:/gluster/brick slave2.hadoop.com:/gluster/brick slave3.hadoop.com:/gluster/brick
#gluster volume create data replica 4 transport tcp master.hadoop.com:/gluster/brick slave1.hadoop.com:/gluster/brick slave2.hadoop.com:/gluster/brick slave3.hadoop.com:/gluster/brick

gluster volume start block
mount -t glusterfs 127.0.0.1:/block /block
echo "/block 127.0.0.1(rw,sync,no_root_squash)" /etc/exports

gluster pool list

echo "UUID=0dd7f959-8174-44d5-b5a4-a77b394e6ad7" > /var/lib/glusterd/glusterd.info
echo "operating-version=30800" >> /var/lib/glusterd/glusterd.info
