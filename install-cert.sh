DOMAIN='vooh.ru'
cat /etc/letsencrypt/live/$DOMAIN/fullchain.pem /etc/letsencrypt/live/$DOMAIN/privkey.pem > /etc/ssl/$DOMAIN.pem
