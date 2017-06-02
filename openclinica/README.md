docker network create openclinica-nw
docker run -d --name openclinica-db --net openclinica-nw ivories/openclinica-db
docker run -d --name openclinica --net openclinica-nw -p 8080:8080 ivories/openclinica

http://ip:8080/OpenClinica
user:root
pass:12345678

