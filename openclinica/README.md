docker network create openclinica-nw
docker run -d --name openclinica-db --net openclinica-nw wnameless/openclinica-db
docker run -d --name openclinica --net openclinica-nw -p 8080:8080 ivories/openclinica:1.0

http://ip:8080/OpenClinica
