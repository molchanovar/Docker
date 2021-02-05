FROM alpine:3.13
RUN apk update && apk add nginx
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./*.html /usr/share/nginx/html/
EXPOSE 80 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]
