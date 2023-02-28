# If no cert use fake one
#cat ./key.pem ./cert.pem > /etc/haproxy/certs/example.com.pem
#rm ./key.pem ./cert.pem
#ls -la /etc/haproxy/certs

# Get/Renew LetsEncrypt certificate
# TODO Move this stuff to the container
#DOMAIN='vooh.ru'
#mkdir -p /etc/haproxy/certs/
#certbot certonly --standalone --non-interactive --agree-tos --email tamtakoe@gmail.com --http-01-port 8888 -d vooh.ru -d www.vooh.ru
#cat /etc/letsencrypt/live/$DOMAIN/fullchain.pem /etc/letsencrypt/live/$DOMAIN/privkey.pem > /etc/haproxy/certs/$DOMAIN.pem

# Run HaProxy
haproxy -f /opt/haproxy-letsencrypt/haproxy.cfg
