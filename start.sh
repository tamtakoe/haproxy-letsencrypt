cat ./key.pem ./cert.pem > /etc/haproxy/certs/example.com.pem
rm ./key.pem ./cert.pem
ls -la /etc/haproxy/certs
haproxy -f /opt/haproxy-letsencrypt/haproxy.cfg
