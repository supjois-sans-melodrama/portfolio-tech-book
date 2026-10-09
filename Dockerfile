FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY techbook.html /usr/share/nginx/html/index.html
EXPOSE 80
