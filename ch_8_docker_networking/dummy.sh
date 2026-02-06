docker network ls
docker network inspect bridge 
docker network inspect bridge | grep bridge.name 
brctl show
ip link show docker0
docker network create -d bridge localnet 
#as we have now created the one more network maybe in system ow we should have some extra local linux network bridge 
brctl show 

docker run -d --name c1 \
--network localnet \
alpine \
sleep 1d

docker network inspect localnet --format '{{json.Containers}}' | jq

docker run -it --name c2 \
--network localnet \
alpine sh 

docker run -d --name web \
--network localnet \
--publish 5005:80 \
nginx

docker port web<container_name>

docker run  \
-it \
--name client \
--network localnet/bridge \
alpine \
sh


apk add curl 

# we have to make sure the system matches our eth or esp 
docker network create \
-d macvlan \
--subnet=10.0.0.0/24 \
--ip-range=10.0.0.0/25 \
--gateway=10.0.0.1 \
-o parent=eth0.100 \ 
macvlan100

docker network inspect macvlan100
 
docker run -d \
--name c1 \
--network macvlan100 \
alpine \
sleep 1d

journalctl -u docker.service 

docker run -it \
--name custom-dns \
--dns=8.8.8.8 \
--dns-search=nigelpoulton.com \
alpine \
sh

cat /etc/resolv.conf

docker service create -d --name svc1 \
--publish published=5005,target=80,mode=host \
nginx

docker service rm <service_name>
docker container rm <conmtainer_name_of_list>
docker network rm <list_of_networks_we_want_to_delete>

#####################################################################################################################

docker network ls 

docker network inspect bridge

docker network inspcet | grep bridge.name


####linux native commands
brctl show
ip link show docker0
###

#create the network (-d==--driver)
docker network create -d bridge localnet

docker run -d --name c1 \
--network localnet
alpine sleep 1d

docker network inspect localnet --format '{{json .Containers}}' | jq

docker run -d --name eg1 \
--network localnet \
--publish 5005:80 
nginx 

docker port eg1

docker run -it --name client --network bridge alpine sh

#special type of networking type

docker network create -d macvlan \
--subnet=10.0.0.0/24 \
--ip-range=10.0.0.0/25 \
--gateway=10.0.0.1 \
-o parent=eth0.100 \
macvlan100 

docker run -d --name ctr1
--network macvlan100 \
alpine sleep 1d

docker logs vantage-db

docker run -it --name custom-dns \
--dns=8.8.8.8 \
--dns-search=nigelpoulton.com \
alpine sh

docker port <container_name>

docker run -it --name client --network bridge alpine sh

docker network rm $(docker network ls -q) -f

docker network create -d macvlan \
--subnet=10.0.0.0/24 \
--ip-range=10.0.0.0/25 \
--gateway=10.0.0.1 \
-o parent=eth0.100 \
macvlan100

journalctl -u docker.service

##################################################################################################################################################################
#!/bin/bash
how can we list all the networks present in our docker 
how can we inspect the particaular docker network
how can we inspect the docker particaular network and apply copmmand grep bridge.name 
what does brctl show command does 
what does ip link show docker0 command does?
how can we create a network using driver bridge 
how can we run alpine using this network we just created in detached mode with custom name as c1 and also give cmd as sleep 1d
how can we inspect docker network we have just created aslo use flag --format '{{json.Contaienrs}}' | jq
again what does command brctl show does ?
what is the use of flag --name  or --net-alias as in docker contaienr naming
how can we publsh nginx as server and on port 5005:80 on bridge localnet network we have just created 
what does command apk add curl deos to oour system ?
how can we create macvlan network ? why does we need to give subnet ? iprange ? gateway ? -o parent ? name of the network ? while creating the docker neytwork for the macvlan why does we need to pass on so many flags comapre tothe simple network creation
how can we inspect the macvlan network that we have just cereatd 
what does journalctl -u docker.service does?
explain the flag --dns and --dns-search in detail 
how can we create service  ? 
what is ingress in terms of docker networking 
how can we remove service 
how can we remove network 
how can we remove contaienr 










