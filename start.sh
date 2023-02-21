cat ./key.pem ./cert.pem > /etc/haproxy/certs/example.com.pem
rm ./key.pem ./cert.pem
haproxy -f /opt/haproxy-letsencrypt/haproxy.cfg
