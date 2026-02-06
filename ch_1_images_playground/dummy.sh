#how to see all the images present in the docker 
docker images

#how to pull docker image using just 1.name  2. using name and registry 3. name+tag 4. full registry+ name + reposirtory +tag
docker pull redis 
docker pull docker.io/redis
docker pull docker.io/redis:latest

#how can we inspect the image 
docker image inspect redis 

#how can we check the digest for all the images
docker images --digests #for all the images
#how can check the digest for the particular image 
docker images --digests <specific_image_name_full>

#how can we check the manifest file for the image 
docker manifest inspect redis 

#how to list down all the builders 
docker buildx ls 

#how to run and delete the golang image after the use also run the command go verison
docker run \
-rm \
--name dummy \
golang go version


#how can we see the manifest file into fulll thorough detail 
docker buildx imagetools inspect redis 

#how can we inspect the manifest file and also apply grep on that to access any particaular enviornment variables
docker manifest inspect redis | grep "os"
docker manifest inspect golang | grep "architecture\|os"


#how to build a custom image using desktop-linux builder and platform as linux/arm64 and linux /amd64 with custom name and dont --push rather --load from the current directory
#this is basically for the lcoalrepositroy
docker buildx build \
--builder=desktop-linux \
--platform=linux/arm64,linux/amd64 \
-t extra . --load

#this is basically for the remoteRepositroy on dockerhub
docker buildx build \
--builder=desktop-linux \
--platform=linux/arm64,linux/amd64 \
-t ravi6685/extra . --push


#how can check the vulnerabilities in the docker image 
docker scout quickview ravi6685/extra

#how can we get cuves from scout 
docker scout cves ravi6685/extra

#how and also tell me how can we get recommendattions for the image we are trying to inspect 
docker scout recommendations ravi6685/extra:latest


#how to delete a particular image
docker rmi <image_name>

#how to delete all the images 
docker rmi $(docker images -q) -f

#how to get the list for  all the images id
docker images -q


#how can we delete a image forcefully
docker rmi image_name -f