DOMAIN='vooh.ru'
mkdir -p /etc/haproxy/certs/
certbot certonly --standalone --non-interactive --agree-tos --email tamtakoe@gmail.com --http-01-port 8888 -d vooh.ru -d www.vooh.ru
cat /etc/letsencrypt/live/$DOMAIN/fullchain.pem /etc/letsencrypt/live/$DOMAIN/privkey.pem > /etc/haproxy/certs/$DOMAIN.pem
chmod 600 /etc/haproxy/certs/$DOMAIN.pem
