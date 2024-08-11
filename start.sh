#!/bin/bash

#Building image for container "front" with Dockerfile in current dir:
docker build -t wordpress:001 - < Dockerfile
[ $? -ne 0 ] && echo -e "\033[32m Build failed, check Dockerfile or access to docker hub\033[0m" || echo -e "\033[33m Build ok!\033[0m"
#Making isolated network for containers:
docker network create --subnet 192.168.111.22/28  wordpress_net001

#Start mysql-container in isolated network:
docker run --rm --name mysql -e MYSQL_ROOT_PASSWORD=verystr0ngp@ssw0rd -e MYSQL_PASSWORD=word0pass -e MYSQL_USER=abuser -e MYSQL_DATABASE=wordpress -v $(pwd)/sqldb:/var/lib/mysql --net wordpress_net001 -d mysql:5.7

#Start container "front" 
docker run --rm --name front  -p 8080:80 --net wordpress_net001 -d wordpress:001

#Check for started containers:
docker ps
echo -e '\033[33m Please wait a bit for creating db and  open http://127.0.0.1:8080 to make shure that the site is working normally \n If you want to stop containers, simply type "docker stop mysql front"\033[0m'
