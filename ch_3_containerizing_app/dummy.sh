#how can we create docker related starter files for the project // how is this the best way 
docker init 

#how can we build image from the docker file inside the present diretory
docker buildx build \
-t  ravi6685/hello-world .

#how can we docker image when the dockerfile has  a custom name using the flag -f
docker buildx build \
-t ravi6685/hello-world \
-f path/to/custom-docker-file .


#how can we list down all the images in pur local repository 
docker images


#how can we build the image using custom builder(desktop-linux) and platform as linux/arm64 and linux/amd64 
docker buildx build \
--builder=desktop-linux \
--platform=linux/arm64,linux/amd64 \
-t ravi6685/hello . #if we have dockerfile present in the current directory 
    #give the custom name as flag -t also dont give the dockerfile rather give custom-name-dockerrFile
        docker buildx build \
        --builder=desktop-linux \
        --platform=linux/arm6,linux/amd74
        -t ravi6685/hello 
        -f path/to/customFile .



#how can we remove the image 
docker rmi <image_name> -f

#how can we inspect the image 
docker image inspect <image_name>

#how can we change the tag from old to new
docker tag <old > <new>


#how can we push the tag to the custom tag to that repository tag
docker login
docker push <repostiory_name_same_as_image_name>:latest

#how can we commit the container with message and author and also give the new tag  proper 
#sometimes i guess its hard to use rather we can also use 
docker commit -A "ravi" -m "made some extra changes" <my_container_id/container name> ravi6685/repositry:version1.0
docker export 56635a0be3c0


#how can we run the image we have cretaed in detached mode with c1 as name port as 5005 and 8080 of container 
docker run \
-d \
--name c1\
-p 5005:8080 \
ravi6685/extra 


#how can we see all our running containers
docker ps 

#how can we check the history of the the docker image or container <what does history gives us>
docker history <image_name> #all remember we just need the image name not the container name 

#how can we inspect the image we have just created 
docker image inspect <image_name>


#how can we build a docker image from the dockerFIle / custom-dockreFile name 
docker buildx build \
-t ravi6685/dummy:v1 .

docker buildx build \
-t ravi6685/extra:latest \
-f path/to/custom_docker_file .

#how can we see all the builders present in our system 
docker buildx ls

#how can we extract two images from a single dockerFil
#using the docker file we have just created
    #first of all how can we write some docker file like this in the first PLace
    #already written in the multi_stage_folder

#how can list all the builders we have present in our system 
docker buildx ls 

#how can we inspect the particular builder in our system 
docker buildx inspect <builder_name>(desktop-linux)

#how can we create our own builder with custom driver and name that builder as random name 
docker buildx create \
--driver=docker-container \
--name container 

#how can we use that builder we have created
docker buildx use <builder_we have created>(container)


#how can we inspect that builder we have cretaed
docker buildx inspect container 


#how can we build a image using our own custom builder use flag --builder and for platfrom linux/arm64 and linux/amd64 
docker buildx build \
--builder=container \
--platform=linux/arm6,linux/amd64 \
-t dummy_for_builder .

    custom name of that image and firt push that to docker hub and thn try to laod that docker image in pour local repsotiroy
    docker buildx build \
    --builder=container \
    --platform=linux/arm6,linux/amd64 \
    -t dummy_for_builder --load/--push .


#how can we create docker builder for the cloud 
  # we will use driver in creation and builder while creating the image
  #in actuall there are 2 types of driver 1.docker-desktop 2.cloud(for this we need money) 
docker buildx create \
  --driver cloud \ 
  --name my-cloud-builder \
  docker/build-cloud



#the builder we have creted in line 94 use that to create a docker image 
docker buildx build \
--builder=<name_of_builder_we_created> \
--platform=linux/arm64,linux/amd64 \
-t <tag we wanrt to give> \
--push/--load \
-f path/to/dockerfile . 


#how can we remove the image we have created 
docker rmi <image_name_we_have_created>


#how can we  create specific stage build from multi-stage 
        #just use the target flag
docker buildx build -t <tag_we_want_to_give> --target prod-client -f path/to/custom_dockerfile .
docker buildx build -t <tag_we_want_to_give> --target prod-server -f path/to/custom_dockerfile .


#tell me in detail about the docker multistage build 
#this is covered in detail in next classs


