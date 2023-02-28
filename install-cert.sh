DOMAIN='vooh.ru'
RUN mkdir -p /etc/haproxy/certs/
cat /etc/letsencrypt/live/$DOMAIN/fullchain.pem /etc/letsencrypt/live/$DOMAIN/privkey.pem > /etc/haproxy/certs/$DOMAIN.pem
