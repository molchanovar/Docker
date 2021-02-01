FROM alpine:3.13
RUN apk update && apk add nginx && mkdir -p /run/nginx
COPY ./index.html /usr/share/nginx/html/index.html
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
