# haproxy-letsencrypt

```sh
docker build -t haproxy-letsencrypt .
docker run --rm -d -v /opt/haproxy-letsencrypt:/opt/haproxy-letsencrypt -p 8182:8182 -p 80:80 haproxy-letsencrypt
```
