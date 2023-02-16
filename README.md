# haproxy-letsencrypt

```sh
docker build -t haproxy-letsencrypt .
docker run --rm -d -v /opt/haproxy-letsencrypt:/opt/haproxy-letsencrypt -p 1344:1344 -p 80:80 haproxy-letsencrypt
```
