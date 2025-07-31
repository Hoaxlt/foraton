FROM nginx:alpine

RUN rm /usr/share/nginx/html/index.html

RUN echo "<html><body><h1>Hello from DevOps!</h1></body></html>" > /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]