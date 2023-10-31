# Create reverse proxy with nginx builder image and configuration

## Create new app
```
oc new-app registry.access.redhat.com/ubi9/nginx-120~$HOME/src/ocp/webfolder --name=nginxbase
```

## Create Dockerfile
```
FROM nginxbase:latest
ADD nginx.conf /opt/app-root/etc/nginx.conf
ADD nginx-proxy.conf /opt/app-root/etc/nginx.default.d/nginx-proxy.conf
```

## Build 
```
oc start-build nginxbase --from-dir=$HOME/src/ocp/webfolder --follow
```
## Create route


