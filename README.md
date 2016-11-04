# Haproxy configurable by env 

### Usage

 * HTTP(S)_some_var=host_to_listen,another_host;host_to_proxy
 * HTTP(S)_REDIRECT_some_var=host_to_listen,another_host_to;host_to_redict;redirect_code;redirect_scheme
 
### Example
```bash
docker service create \
	--name haproxy \
	--network haproxy \
	--publish 80:80 \
	--publish 443:443 \
	--env HTTPS_nginx=nginx.local,127.0.0.1:80 \
	--env HTTPS_REDIRECT_www=www.nginx.local;nginx.local;301;https \
	--mount type=volume,source=HAPROXY_CERTS,destination=/usr/local/etc/haproxy/certs \
	grachev/swarm-haproxy
```
