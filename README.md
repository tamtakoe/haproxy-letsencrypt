# haproxy-letsencrypt

```sh
docker build -t haproxy-letsencrypt .
docker run --rm -d -v /tmp/:/run/haproxy/ -p 8182:8182 -p 80:80 haproxy-letsencrypt
docker run --rm -d -v /etc/ssl/:/etc/haproxy/certs/ -p 8182:8182 -p 80:80 haproxy-letsencrypt
#docker run --rm -d -v /opt/haproxy-letsencrypt:/opt/haproxy-letsencrypt -v /tmp/:/run/haproxy/ -p 8182:8182 -p 80:80 haproxy-letsencrypt
```

#### Install Certbot
```shell
# Install snap and check installation is successful
sudo apt update
sudo apt install snapd
sudo snap install core
sudo snap refresh core

# Install Certbot
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

sudo certbot certonly --webroot -w /var/www/vooh.ru -d www.vooh.ru -d vooh.ru

# Prepare server
sudo mkdir -p /var/www/vooh.ru
sudo mkdir -p /etc/ssl/vooh.ru
```
