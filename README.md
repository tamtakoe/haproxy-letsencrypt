# haproxy-letsencrypt

```sh
docker build -t haproxy-letsencrypt .
docker run --rm -d -v /etc/haproxy/certs/:/etc/haproxy/certs/ -p 80:80 -p 443:443 -p 8182:8182 haproxy-letsencrypt
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

#sudo certbot certonly --webroot -w /var/www/vooh.ru -d vooh.ru -d www.vooh.ru
sudo certbot certonly --standalone --non-interactive --agree-tos --email tamtakoe@gmail.com --http-01-port 8888 -d vooh.ru -d www.vooh.ru

# Successfully received certificate.
# Certificate is saved at: /etc/letsencrypt/live/www.vooh.ru/fullchain.pem
# Key is saved at:         /etc/letsencrypt/live/www.vooh.ru/privkey.pem
# This certificate expires on 2023-05-23.

# Prepare server
sudo mkdir -p /var/www/vooh.ru
sudo mkdir -p /etc/ssl/vooh.ru
```
