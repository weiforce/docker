# step 1
cd /nasgo-dockerfile
docker build . -t ivories/nasgo

# step 2
sudo mkdir -p /home/core/data/nasgo
sudo touch /home/core/data/nasgo/blockchain.db
sudo docker run -d --name nasgo -v /home/core/data/nasgo/blockchain.db:/nasgo-node/blockchain.db -p 9040:9040 ivories/nasgo

# view log
docker logs nasgo

# restart the server
sudo docker stop nasgo
sudo docker rm nasgo
sudo docker run -d --name nasgo -v /home/core/data/nasgo/blockchain.db:/nasgo-node/blockchain.db -p 9040:9040 ivories/nasgo
