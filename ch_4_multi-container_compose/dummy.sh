#how can we check our compose version of docker 
docker compose version

#how to clone any github repository 
github clone <link_of_the_repository>

#how can we create a multicontainer app and than run that multicontainer app 
#we have written the dockerfile and compsoe file for the deployment 
docker compose up -detach 
    #from the composefile and customName ComposeFile -f flag 
    docker compose -f path/to/file <dont use . this> up --detach

#how can we see all the container presently running in our docker enviornment 
docker ps 

#how can we list down our all docker networks 
docker network ls 

#how can we list down our all volumes in docker volumes
docker volumes ls 

#how can we stop our all the multicontainer apps using just one command 
docker compose down

#how can we see the all container of the compose file only 
docker compose ps


#how can we list donw all the active process from the compose containers 
docker compose top


#how can we restart the compose containers
docker compose restart 


#how can we list down all the compose file that are active in our docker enviornment
docker compose ls


#how can we delete our compose container along with volumes , images and all
docker compose down --volumes --rmi all 

