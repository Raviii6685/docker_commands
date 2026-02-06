docker volume ls 
docker volume create <volume_name>
docker volume inspect <volume_name>
docker volume prune --all
docker volume rm <volume_name>

docker run \
-itd \
--name vol_container \
--mount source=<volume_name>,target=<container_folder_to_where> \
alpine

how can we list down all the important volumes in the localrepository
how can we create volume 
how can we inspect volume we have just created 
how can we remove unwanted volumes from the system 
how cna we remove the particaular violume we have just creteated
