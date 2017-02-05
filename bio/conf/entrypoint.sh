#!/bin/bash

export YARN_IDENT_STRING=root
export HADOOP_SSH_OPTS="-F /root/.ssh/config"
chown -R root:root /hadoop


if [ "" = "$MASTER_HOSTNAME" ]; then
    MASTER_HOSTNAME=$HOSTNAME
fi

if [ "$MASTER_HOSTNAME" != "$HOSTNAME" ]; then
    HOSTNAME=$MASTER_HOSTNAME
    IS_MASTER="no"
fi

cd /hadoop/etc/hadoop
sed -i "s/HOSTNAME_HADOOP/${HOSTNAME}/g" core-site.xml
sed -i "s/HOSTNAME_HADOOP/${HOSTNAME}/g" hdfs-site.xml
sed -i "s/HOSTNAME_HADOOP/${HOSTNAME}/g" mapred-site.xml
sed -i "s/HOSTNAME_HADOOP/${HOSTNAME}/g" yarn-site.xml

sed -i "s#<value>1</value>#<value>4</value>#g" hdfs-site.xml
sed -i "s#</configuration>#<property><name>dfs.balance.bandwidthPerSec</name><value>10485760</value></property></configuration>#g" hdfs-site.xml
#sed -i "s#<value>/data/hdfs/data</value>#<value>/data/hdfs/data1,/data/hdfs/data2,/data/hdfs/data3,/data/hdfs/data4</value>#g" core-site.xml
if [ ! -d "/data/hdfs" ]; then
    mkdir /data/hdfs && chown -R hduser:hadoop /data/hdfs
    if [ "$IS_MASTER" == "" ]; then
        hdfs namenode -format
    else
        hdfs datanode -format
    fi
fi

if [ "$IS_MASTER" == "" ]; then
    /usr/sbin/sshd
    /hadoop/sbin/start-dfs.sh
    /hadoop/sbin/start-yarn.sh
    /spark/sbin/start-master.sh
fi

/spark/sbin/start-slave.sh ${HOSTNAME}:7077
/hadoop/sbin/hadoop-daemon.sh start datanode
/hadoop/sbin/yarn-daemon.sh start nodemanager

tail -f /spark/logs/*

#export SPARK_DAEMON_MEMORY="${SPARK_DAEMON_MEMORY:-128M}"
#export SPARK_HOME="/spark"
