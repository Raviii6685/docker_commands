
#how can we init the swarm 
docker swarm init 

#how can we join the swaem 
docker swarm join --token <token>

#how can we leave the swarm / also forcefully
docker swarm leave 
docekr swarm leave --force

#howe can we check our swarm nodes
docker node ls 