#how can we make any file into a script (by this we are telling the interpretor of the file actually)
#!/bin/bash

#how and why we add wasm32-wapi to our rust 
#install ruct and spin also #rustup target add wasm32-wapi

#how to check our spin --version
spin --version


#how can we list down our all docker wasm runtime enviroments
docker run \
--rm \
-i \
--privileged \
--pid=host \
jorgeprendes420/docker-desktop-shim-manager:latest


#how can we create our wasm using the spin 
spin new hello-world<name of teh project we are trying to create > -t http-rust <this is the template >

#how can we  build our app that we have cretaed in 38
spin build 

#how can we create our docker image for the wasm platform and provenance=false and custom tag
docker buildx build \
--platfrom=wasi/wasm \
--provenance=false \
-t ravi6685/wasm_app .

#how can we push that image to our dockerhub repository
docker push ravi6685/wasm_image:latest

#how can we run the docker image we have just cretaed 
    #in detached mode custom name 
    #custm runtime 
    #custom wasm platfrom 
    #custom ports
    #now use the image name we hacve just created
docker run \
-dit \
--name wasm_container \
--runtime=io.containerd.spin.v2 \
--platform=wasi/wasm \
-p 5556:80 \
ravi/wasm_app:latest 

#how can we delete the wasm image and container we have just created
docker rmi <wasm_Image_name> -f
docker rm <container_name> -f