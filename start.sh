#!/bin/bash

echo ""
echo "Starting nginx container to test cache options"

if docker ps | grep -q -e "nginx-cache-test"
then
  echo "Found previously created container. Removing it..."

  docker rm -f "nginx-cache-test" &> /dev/null

  echo "Previous container was successfully removed. Starting a new one..."
fi

docker run --name "nginx-cache-test" \
  --mount type=bind,source="$(pwd)"/images,target=/var/www/html/images,readonly \
  --mount type=bind,source="$(pwd)"/nginx.conf,target=/etc/nginx/nginx.conf,readonly \
  -p "127.0.0.1:8080:80" \
  -idt nginx:alpine 1> /dev/null

echo "Started nginx container on http://localhost:8080"
echo "You can check some beautiful images here: http://localhost:8080/images/image_1.jpeg"
echo "It is a view of the Carpathian Mountains"
