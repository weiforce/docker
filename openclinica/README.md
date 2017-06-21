docker network create openclinica-nw
docker run -d --name openclinica-db --net openclinica-nw -v /home/core/data/openclinica/database:/var/lib/postgresql/data ivories/openclinica-db
docker run -d --name openclinica --net openclinica-nw -p 8080:8080 -v /home/core/data/openclinica/openclinica.data:/usr/local/tomcat/openclinica.data ivories/openclinica

http://ip:8080/OpenClinica
user:root
pass:12345678

