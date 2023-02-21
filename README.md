# haproxy-letsencrypt

```sh
docker build -t haproxy-letsencrypt .
docker run --rm -d -v /tmp/:/run/haproxy/ -p 8182:8182 -p 80:80 haproxy-letsencrypt
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

# Prepare server
mkdir -p /var/www/vooh.ru
```
