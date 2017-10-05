1.add webroot to nginx
server
{
  server_name download.domain.com;
  root /www/domain;
}

2.run docker
docker run -it --rm -v /home/core/data/www/letsencrypt:/etc/letsencrypt -v /home/core/data:/data ivories/certbot 
3.run command
certbot certonly --webroot -w /data/www/domain --email=master@domain.com --verbose --noninteractive --agree-tos -d download.domain.com

other way use letsencrypt
https://github.com/YJBeetle/letsencrypt-dnspod
https://github.com/lukas2511/dehydrated
