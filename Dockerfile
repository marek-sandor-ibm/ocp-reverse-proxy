FROM nginxbase:latest
ADD nginx.conf /opt/app-root/etc/nginx.conf
#ADD nginx-proxy.conf /opt/app-root/etc/nginx.default.d/nginx-proxy.conf

