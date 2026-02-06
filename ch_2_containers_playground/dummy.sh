#how can we check our docker current version
docker version

#how in linux how can we check wheteher if our docker  is running or not
systemctl is-active docker 
service docker status 


#how can we run nginx image on port 8080 of host with custom name and also in detached mode 
docker run \
--rm \
--name custom_nginx_server \
-dit \
-p 8080:80 \
nginx



#how can we then execute the command inside that nginx image container 
docker exec -it custom_nginx_server ls 
docker exec -it custom_nginx_server servcie nginx status 
#how can we execute the command as ssh in that image of nignx
docker exec custom_nginx_server ls 


#how can we attach to the main process of the contaienr 
docker attach container_name


#what is the differnece betwenn exec -it and exec
            # one is like localterminal and other is for ssh type


#how can we inspect the container
docker container inspect custom_nginx_server


#how can we run the container with argumnets/flags , image name and also commands
docker run \
--rm \
-dit \
-p 8080:80 \
--name server \
nginx 
sleep 60


#how can we run the alpine image with detached mode and also using --rm flag and giving the custom sleep command 
docker run \
-dit \
--rm \
alpine \
sleep 60

#how can we list down all the entites present in the directory usig the linux command 
ls -ahl

#how can we check all the current running processes
ps -a

#how can we open vim notepad
vim  file_name


#how can we inspect the contaienr 
docker container inspect <container_name>


#how can we attach to the main process of the conatiner 
docker attach <container_name>


#how can we stop the container 
docker stop <cotaiener name>


#how can we list down all the conatienrs
docker ps

#how can we restart the containers
docker start <container_name>

#how can we list down the contents of the files in linux 
cat file_name

#how can we down all the container irrespective of wheteher they are running or not 
docker stop $(docker ps -aq)


#how can we remove the container 
docker rm <conatiner_name>


#how can we forcefully remove all the contaienrs
docker rm $(docker ps -aq) -f

#how can we list all ids of the cotaienrs/running or not dpepends 
docker ps -aq

#how can we delete all the containers
docker rm $(docker ps -aq) -f


#how can we run the container with custom name , detached mode and -it flag (what does this flag do)  alpine iamge  with a sh command 
docker run \
--rm \
--name custom_alpine \
-dit \
alpine sh 



#how can we login in the dockerhub from the terminal 
docker login

#how can we get the information in thorough for the docker client and the server 
docker info #kindof great command to know about docker in detail


#how to use the docker debug container name / image name 
docker debug custom_alpine

#how can we run the docker with the --restart (always , on-fialure , no , unless-stopped)
docker run --restart alpine sleep 60

#how can we delete a contaier 
docker rm <conatiner_name / id >

#how can we delete a container forcefully 
docker rm contaienr_name -f

#how can we list down all the containers with ids 
docker ps -aq

#how can we delete all the contaienr from one singgle command 
docker rm $(docker ps -aq) -f