# A basic NGINX Dockerfile template

ARG NGINX_VERSION=latest

FROM nginx:$NGINX_VERSION

COPY [ "./code", "/usr/share/nginx/html" ]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
