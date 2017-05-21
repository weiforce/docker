docker network create openclinica-nw
docker run -d --name openclinica-db --net openclinica-nw wnameless/openclinica-db
docker run -d --name openclinica --net openclinica-nw -p 8080:8080 wnameless/openclinica

http://ip:8080/OpenClinica
