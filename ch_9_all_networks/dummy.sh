#this commands to be run on linux terminal 

ip address show 
ip address show #again after the virtualbox setting to NAT 
sudo apt update 
sudo apt install docker.io
ip address show 
#same as brctl show
docker network ls
brdige link #this command will show up the veth to the bridge swtich 
ip route 
#network type = driver 
#1.Default bridge
docker run -dit \
--rm \
--name thor \
busybox

docker run -dit \
--rm \
--name mjolnir \
nginx

docker run -dit \
--rm \
--name stormbreaker \
busybox
#own DHCP
#own DNS (/etc/resolv.conf)
#local switch connecting these contaieners
docker network inspect bridge 

#####drawbacks -> 
#we can reach all the containers by publishing the port not directly
#manually expose the port 
docker run -dit \
--rm \
-p 8080:80 \
--name thor \
busybox
#these all have default docker network bridge 


#2.Custom default bridge (User-Defined Bridge)
docker network create -d bridge localnet 
ip address show 
docker network ls

docker run -dit \
--network localnet \
--rm \
--name thor \
busybox

docker run -dit \
--network localnet \
--rm \
--name odin \
busybox


docker run -dit \
--network localnet \
--rm \
--name loki \
busybox

docker inspect localnet 

#we should use this due to isolation ; now this is isolated from the default network ;
# now we have also container to contaienr dns <container_name> to <container_name> DNS 
#ip lose coupling has been done


#3. host network (part of the default)

docker run -dit \
--network host \
--rm \
--name odin \
nginx

docker run -dit \
--network host \
--rm \
--name odin \
nginx

#in this docker network we dont have to manually pubhslish the ports it will use the host ports directly and
#it totally bumps of the host network shares its ip address ; ports ; no need to expose ports 
#no virtual ip ; just like another application runing on the host ; no isolation


#4. macvlan 
#connecting the docker container directly to the physical network ; but need nic promiscous mode should be on else this 
#will fail catastrophically 
#this will have their own ip addresses and own mac address ; feeling of like directly  connected to the physical networ or switch we can say 

docker network create -d macvlan \
--subnet=<home_network_subnet> \ 
--gateway=<router_of_home> \
-o parent=<host_network_interface> \
macvlan.100


docker run -dit \
--network macvlan.100 \
--ip <not_used_in_physical_network> \
--rm \
--name odin \
nginx


#everythings fine all thing need is to turn on the NIC promiscuous mode <in VM settings >
ip link set <host_network_interface_used_for_macvlan> promisc on

#####drawbacks -> 1.mac address problem ; 2.no DHCP (we have to manually assign the ip else docker can create a fuck UP using own DHCP)
#solution give the --ip-range while creating the docker netork macvlan

docker network create \
-d macvlan \
--subnet=<?> \
--ip-range=<?> \
--gateway=<?> \
-o parent=<?> \
macvlan.200
#this will  assgin ip from this range we have just provided 
#this was the macvlan bridge mode 
#########4.2 macvlan(802.1q) mode 
#this will create the subinterface on teh localhost on this VLANs as a trunk

docker network create -d macvlan \
--subnet=<new_random_subnet> \
--gateway=<new_random_gateway> \
-o parent=<this_will_be_parent>.<new VLAN 100/200/300 etc> \
#this above interface dont exist but docker will create it automatically when started this 
macvlan.20

ip address show 
#new sub interface setUP


#5. IPVLAN (L2) ; this is the default in ipvlan mode 
#same as macvlan in this the containers will have same mac address as the host on which they are deployed
docker network create -d ipvlan \
--subnet=<parent_subnet> \
--gateway=<parent_gateway> \
-o parent=<parent_interface> \
ipvlan_net

#still the ip address problem is not resolved
docker run -dit \
--network macvlan.100 \
--ip <not_used_in_physical_network> \
--rm \
--name odin \
nginx


arp #gives the arp table of the system 
arp -n #detailed arp table i guess

#ipvlan (L3) ; this takes the network to layer 3 no more switching ; no more arp
#host act as router ; home network has no idea ho reach these ; totally brand new ;
#the containers connect to the world using the host as router 
#layer 3 connection ; no broadcast traffic in this 
#outside their own network these contaienrs will. not be able to talk any other thing 
#this gives the crazy isolation no one can reach these but we can controll who can reach those 
#in home network / router <ip_table> tell the host where to go as host is acting as router 
#like vxlan
docker network create \
-d ipvlan \
--subnet=<brand_new> \
#just dont give the gateway flag as this will be host automatically 
-o parent=<parent_interface_of_internet> -o ipvlan_mode=l3 \
--subnet=<other_brand_new> \
name 
#network is created but while creating the contaienr we have to specify the container on which subnet it has to enter 
docker run -dit \
--network name \
--ip <from_the_subnet_we_choosed> \
--rm \
--name odin \
nginx


#still differnet subnet contaier reach possible but cant reach internet due to problem ; like packet dont know how to reach them 
#we can static route  to connect to the internet ; for our containers
just use the command 
ip route add #by this command it is possible 




#6.null
docker network ls 
