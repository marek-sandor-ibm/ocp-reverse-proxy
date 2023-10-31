# Create reverse proxy with nginx builder image and configuration

## Clone repo

In your sources directory clone ```https://github.com/marek-sandor-ibm/ocp-reverse-proxy.git```. 

## Create new app
```
oc new-app registry.access.redhat.com/ubi9/nginx-120~$HOME/src/ocp/ocp-reverse-proxy --name=nginxbase
```

## Create Dockerfile

Verify Dockerfile and edit it if needed. To make it simple, there is provided whole nginx.conf file with / location directly. 

```
FROM nginxbase:latest
ADD nginx.conf /opt/app-root/etc/nginx.conf
```

## Build 
```
oc start-build nginxbase --from-dir=$HOME/src/ocp/ocp-reverse-proxy --follow
```
## Create route

In OCP console as Administrator create in Networking->Routes section new route and set Location to your desired publicly available host. ```Service = nginxbase``` and TLS ```Termination type = edge```.

## Test it

In your browser naviagate to url provided in the route location.


