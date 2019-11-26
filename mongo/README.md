注意：下面运行各mongod时，要事先建好dbpath目录，并且目录是空的
1.	各分片数据服务器中运行分片数据服务
		mongod --fork --bind_ip_all --shardsvr --port ... --dbpath ... --logpath ...			默认port为27018

2.	至少运行3个配置服务，最好在不同的服务器上
		mongod --fork --bind_ip_all --configsvr --replSet 「统一的副本集名称」 --port ... --dbpath ... --logpath ...			默认port为27019

3.	mongo命令或客户端工具连接到任意一个步骤2中启动的配置服务实例，在命令环境里执行rs.initiate
		mongo --host ... --port ...		host和port对应任意一个mongod --configsvr实例的地址和端口
		> rs.initiate( {_id:"「统一的副本集名称」", members:[{_id:..., host:"配置服务器1的ip:port"}, {_id:..., host:"配置服务器2的ip:port"}, ...]} )
		说明：members中把所有配置服务器的信息列出来。注意这里所写的配置服务器ip要让路由可以访问到，比如若配置服务与路由服务不在同一机器上，这里就不能写成localhost(只有配置服务和路由服务在同一机器上才能写成localhost)

4.	运行路由，与配置服务器建立关联。可以有一个或多个路由。路由不负责存数据，只负责接受客户端请求，故调用时访问路由而不是其它地址
		mongos --fork --bind_ip_all --configdb "「统一的副本集名称」/配置服务器1的ip:port,配置服务器2的ip:port,..." --port ... --logpath ...		默认port为27017，与单节点的mongod一样

5.	往路由加入分片
		mongo --host ... --port ...		host和port对应步骤4中的路由实例
		>sh.addShard("步骤1中分片数据服务ip:port")		步骤1有多少个分片数据服务就addShard多少次，每次只添加一个
		>sh.status()										查看分片添加情况
		>sh.enableSharding("目标数据库")
		>sh.shardCollection("数据库.集合", {分片字段1:1,分片字段2:1,...})		对字段进行内置hash算法分片会自动把给各分片字段添加索引。多字段时各字段必须都为1
		>use 目标数据库
		>db.集合.getShardDistribution()						查看集合数据在各分片中的分布


#示例

#每台机器都运行
mongod --fork --bind_ip_all --shardsvr --port 27018 --dbpath /data/db --logpath /data/log

#每台机器都运行
mkdir /data/db1
mongod --fork --bind_ip_all --configsvr --replSet rs1 --port 27019 --dbpath /data/db1 --logpath /data/log1

#每台机器都运行
mongo --port 27019
rs.initiate( {_id:"rs1", members:[{_id:0, host:"192.168.5.201:27019"}, {_id:1, host:"192.168.5.202:27019"}, {_id:2, host:"192.168.5.203:27019"}]} )

#每台机器都运行
mongos --fork --bind_ip_all --configdb "rs1/192.168.5.201:27019,192.168.5.202:27019,192.168.5.203:27019" --port 27017 --logpath /data/log2


